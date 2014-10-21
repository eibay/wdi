### Simple Auth in Rails

Create a simple rails app that has one authenticated route - `/secret`. No users should be able to visit this page without signing in. There will be no 'sign up' route - all users should be created in `rails console`.

**User**
  * email
  * password_digest (reference ActiveRecord's `has_secure_password` method to remind yourself how this works)

Two pages:

1. `/sign_in`
  * form with an email and a password
  * when submitted with a correct email/pass, makes the user "signed in" - remember session! - and redirects the user to `/secret`
  * if an incorrect email/pass is entered, return the user to the `/sign_in` page and show an error

2. `/secret`
  * A page that shows some sort of secret information. Only signed in users should be able to access this page!