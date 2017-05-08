package grails

class UserController extends BaseController {

    def index() {
        params.max = 3
        def userList = User.list(params);
        [ulist:userList, totalCount:User.count()]
    }



    //def scaffold = true;      only used for testing
    def create(){

    }

    def search(){
        if(params.keyword){
            params.max = 2
            def userList = User.findAllByUsernameIlikeOrUser_type(params.keyword+"%",params.keyword+"%", params)
            def userCount = User.findAllByUsernameIlikeOrUser_type(params.keyword+"%", params.keyword+"%").size();
            render(view: "index", model: [ulist: userList, totalCount: userCount, params: params])
        }
        else{
            redirect(action: "index")
        }
    }

    def save(){
        def user = new User(params);
        if(user.save()){
            redirect(action: "index")
        }
        else{
            redirect(action: "create")
        }
    }

    def edit(){
        def user = User.get(params.id);
        [userInfo: user]
    }

    def update(){
        def user = User.get(params.id);
        user.username = params.username;
        user.password = params.password;
        user.user_type = params.user_type;
        if(user.save()){
            flash.message = "User updated successfully";
            redirect(action: "index")
        }
        else{
            flash.message = "User doesn't exists";
            render(view: "edit", model: [userInfo: user])
        }
    }
    def delete(){
        def user = User.get(params.id);
        if(user){
            user.delete();
            flash.message = "User deleted";
            redirect(action: "index")
        }
        else{
            flash.message = "User doesn't exist";
            redirect(action: "index")
        }
    }
}