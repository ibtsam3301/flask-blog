from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail 
from datetime import datetime
import pymysql
import json
import os
from werkzeug.utils import secure_filename
from math import ceil
pymysql.install_as_MySQLdb()

with open('config.json', 'r') as f:
    params = json.load(f)["params"]

local_server_bool = params["local_server"]

app = Flask(__name__)
app.secret_key = "secret"
app.config['upload_folder'] = params['upload_folder']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD=  params['gmail_pass']
)
mail = Mail(app)


if local_server_bool == 'True':
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
    

db = SQLAlchemy(app)


class Contacts(db.Model):
    '''
    sno, name, email, phone_num, mes, date
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(20),  nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(12), nullable=False)

class Posts(db.Model):
    '''
    sno, title, slug, content, date
    '''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30), nullable=False)
    slug = db.Column(db.String(20),  nullable=False)
    content = db.Column(db.String(12), nullable=False)
    date = db.Column(db.String(200), nullable=False)
    tagline = db.Column(db.String(200), nullable=False)
    img_file = db.Column(db.String(12), nullable=False)
    

@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    
    last = ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page=1

    page = int(page)
    posts1 = posts[((page-1)*int(params['no_of_posts'])): ((page-1)*int(params['no_of_posts'])+ int(params['no_of_posts']))]
    if page == 1:
        prev="#"
        next_ = "/?page=" + str(page+1)

    elif page == last:
        prev = "/?page=" + str(page-1)
        next_ = "#"

    else:
        prev = "/?page=" + str(page-1)
        next_ = "/?page=" + str(page+1)
   
    return render_template('index.html', params=params, posts=posts1, prev=prev, next_=next_)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=["GET", "POST"])
def dashboard():

    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)


    if request.method == 'POST':
        uname = request.form.get('uname')
        password = request.form.get('pass')

        if uname == params['admin_user'] and password == params['admin_pass']:
            session['user'] = uname
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)
        else:
            flash(u'Invalid password provided', 'error')
      
    return render_template('admin.html', params=params)
    


@app.route('/contact', methods=['GET', 'POST'])
def contact():

    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone')
        mes = request.form.get('message')

        entry = Contacts(
            name=name, email=email, phone_num=phone_num, mes=mes, date=datetime.now()
            )
        db.session.add(entry)
        db.session.commit()

        mail.send_message('New message from ' + name,
                        sender=email,
                          recipients = [params['gmail_user']],
                          body = mes + "\n" + phone_num
                          )

    return render_template('contact.html', params=params)


@app.route('/post/<string:post_slug>', methods=['GET']) 
def post(post_slug):
    db_post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=db_post)   


@app.route('/edit/<string:sno>', methods=["GET", "POST"])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            box_title = request.form.get('title') 
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')

            if sno == "0" or "" or None:
                post = Posts(title=box_title, tagline=tline, slug=slug, content=content, img_file=img_file, date=datetime.now())
                db.session.add(post)
                db.session.commit()
                flash("Changes saved!!!") 
                return redirect('/edit/0')
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                db.session.commit()
                return redirect('/edit/'+sno)
                flash("Changes saved!!!")        
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)

    
    
    
    # post = Posts.query.filter_by(sno=sno).first()                
    # return render_template("edit.html", params=params, post=post)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            f = request.files["file1"]
            f.save(os.path.join(app.config['upload_folder'], secure_filename(f.filename))
            )
            flash('File Uploaded')
            return redirect("/dashboard")


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route('/delete/<string:sno>', methods = ["GET", "POST"])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    flash('Deleted successfully!')    
    return redirect('/dashboard')



app.run(debug=True)