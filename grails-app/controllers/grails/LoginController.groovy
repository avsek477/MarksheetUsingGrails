package grails

class LoginController {

    def index() {}

    def postLogin(){
        if(params.username&&params.password){
            def user = User.findByUsernameAndPassword(params.username, params.password)
            if(user){
                session.userid = user.id
                session.username = user.username
                redirect(action: "index", controller: "user")
            }
            else{
                flash.message= "invalid Username or Password"
                redirect(action: "index")
            }
        }
        else{
            redirect(action: "index")
        }
    }

    def logout(){
        if(session.userid){
            session.userid=""
            session.username=""
            session.invalidate()
            redirect(action: "index")
        }
    }
}