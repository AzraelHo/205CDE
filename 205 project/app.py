from flask import Flask, render_template, url_for, redirect, request, session, flash
import pymysql

# All website link
app = Flask(__name__)
app.secret_key = "Any String"

# open database connecton
db = pymysql.connect("localhost", "root", "", "az_cloud")

@app.route("/")
@app.route("/index")
def index():
    return render_template('index.html')

@app.route("/hostpricing")
def hostpricing():
    return render_template('hostpricing.html')

@app.route("/serpricing")
def serverpricing():
    return render_template('serpricing.html')

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/contactus")
def contactus():
    return render_template('contactus.html')

#login page and login function
@app.route("/login", methods=["GET","POST"])
def login():
	if request.method == "POST":

		custemail = None

		email = request.form.get("email")
		pwd = request.form.get("pwd")

		cursor = db.cursor()
		sql = ("SELECT `userID`, `username`, `email`, `password` FROM `customer_info` WHERE `email` = '"+email+"'")
		cursor.execute(sql)
		db.commit()

		results = cursor.fetchall()
		for row in results:
			custID = row[0]
			custName = row[1]
			custemail = row[2]
			custPassword = row[3]
		print(results)

		if email == 'admin' and pwd =='admin':
			flash("Wellcome Admin!","success")
			return render_template('admin.html')
		elif custemail is None:
			flash("Email not found","danger")
			return render_template("login.html")
		else:
			if custPassword == pwd:
				session['username'] = custName
				session['userID'] = custID
				flash("You are now login","success")
				return render_template('index.html')
			else:
				flash("Incorrect password","danger")
				return render_template('login.html')
		db.commit()
		return render_template('login.html')
	return render_template('login.html')

# logout function
@app.route("/logout")
def logout():
	session.clear()
	flash("You are now logout","success")
	return render_template('index.html')
	
# register page and function
@app.route("/register", methods=["GET","POST"])
def register():
	error = None
	if request.method == "POST":
		username = request.form.get("username")
		firstName = request.form.get("firstName")
		lastName = request.form.get("lastName")
		email = request.form.get("email")
		phoneNum = request.form.get("phoneNum")
		password = request.form.get("password")
		confirm = request.form.get("confirm")
		
		if password == confirm:
			# prepare a cursor object using cursor() method
			cursor = db.cursor()
			# Insert data to database
			sql ='''
			INSERT INTO customer_info (username, firstName, lastName, email, phoneNum, password) 
			VALUES ('%s','%s','%s','%s','%s','%s')
			'''
			cursor.execute(sql%(username, firstName, lastName, email, phoneNum, password))
			db.commit()
			return redirect(url_for('login'))
		else:
			flash("Password does not match!","danger")
			return render_template('register.html')

	return render_template('register.html')


# contact us page and function
@app.route("/contact", methods= ['GET','POST'])
def contact():
	if request.method == 'POST':
		contactName = request.form.get("Name")
		contactEmail = request.form.get("Email")
		subject = request.form.get("Subject")

		cursor = db.cursor()
		sql = '''
		INSERT INTO contact (contactName, contactEmail, subject) 
		VALUES ('%s','%s','%s')
		'''
		cursor.execute(sql%(contactName, contactEmail, subject))
		db.commit()
		flash("Submit success","success")
		return render_template('contactus.html')
	return render_template('contactus.html')

@app.route("/cart", methods=['GET', 'POST'])
def cart():
	if request.method == 'POST':
		
		productID = request.form.get("productID")

		cursor = db.cursor()
		sql =("SELECT * FROM `productlist` WHERE `productID` = '"+productID+"'")
		cursor.execute(sql)
		db.commit()

		productDetail = cursor.fetchall()
		for row in productDetail:
			productname = row[0]
			productID = row[1]
			productInfo1 = row[2]
			productInfo2 = row[3]
			productInfo3 = row[4]
			productInfo4 = row[5]
			productInfo5 = row[6]
			productInfo6 = row[7]
			productInfo7 = row[8]
			productInfo8 = row[9]
			productInfo9 = row[10]
			productInfo10 = row[11]
			productInfo11 = row[12]
			productInfo12 = row[13]
			productInfo13 = row[14]
			productPrice = row[15]
			productTime = row [16]
			print(productDetail)

			session['pdName'] = productname
			session['pdID'] = productID
			session['pdInfo1'] = productInfo1
			session['pdInfo2'] = productInfo2
			session['pdInfo3'] = productInfo3
			session['pdInfo4'] = productInfo4
			session['pdInfo5'] = productInfo5
			session['pdInfo6'] = productInfo6
			session['pdInfo7'] = productInfo7
			session['pdInfo8'] = productInfo8
			session['pdInfo9'] = productInfo9
			session['pdInfo10'] = productInfo10
			session['pdInfo11'] = productInfo11
			session['pdInfo12'] = productInfo12
			session['pdInfo13'] = productInfo13
			session['pdPrice'] = productPrice
			session['pdTime'] = productTime
			return render_template('cart.html')
	return render_template('cart.html')

@app.route("/order", methods=['GET', 'POST'])
def order():
	if request.method == "POST":
		productID = session['pdID']
		custID = session['userID']
		payment = request.form.get("payment")

		cursor = db.cursor()
		sql = '''
		INSERT INTO order_list (orderType,customerID,payment)
		VALUES ('%s','%s','%s')
		'''
		cursor.execute(sql%(productID,custID,payment))
		db.commit()
		
		if payment is None:
			flash("Please choose your payment method.","danger")
			return render_template('cart.html')
		else:
			flash("Payment Success, please check your email.","success")
			return render_template('index.html')

@app.route("/admin", methods=['GET','POST'])
def checkuserID():
	if request.method == "POST":
		userID = request.form.get('userID')

		cursor = db.cursor()
		sql = ("SELECT * FROM `customer_info` WHERE `userID` = '"+userID+"'")
		cursor.execute(sql)
		db.commit()

		userinfolist = cursor.fetchone()
		session['userinfo'] = userinfolist
		return render_template('admin.html')






if __name__ == "__main__":
    app.run(debug=True)