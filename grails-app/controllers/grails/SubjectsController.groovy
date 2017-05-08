package grails

class SubjectsController extends BaseController {

    def create(){

    }

    def index() {
        params.max = 2
        def subjectsList = Subjects.list(params);
        [subList: subjectsList, totalCount: Subjects.count()]
    }

    def search(){
        if(params.keyword){
            params.max = 3
            def subjectsList = Subjects.findAllByNameIlike(params.keyword+"%", params)
            def subjectsCount = Subjects.findAllByNameIlike(params.keyword+"%").size()
            render(view: "index", model: [subList: subjectsList, totalCount: subjectsCount, params: params] )
        }
        else{
            redirect: "index"
        }
    }

    def save(){
        def subjects = new Subjects(params);
        if(subjects.save()){
            flash.message = "Subjects saved";
            redirect(action: "index")
        }
        else{
            flash.message = "No such subjects";
            redirect(action: "create")
        }
    }

    def edit(){
        def subjects = Subjects.get(params.id);
        [subjectsInfo: subjects]
    }
    def update(){
        def subjects = Subjects.get(params.id);
        subjects.name = params.name;
        subjects.totalMarks = Integer.parseInt(params.totalMarks);
        subjects.passMarks = Integer.parseInt(params.passMarks);
        if(subjects.save()){
            flash.message = "Subjects updated successfully";
            redirect(action: "index")
        }
        else{
            flash.message = "No such subjects";
            render(view: "edit", model: [subjectsInfo: subjects])
        }
    }
    def delete(){
        Subjects sj = Subjects.get(params.id)
        def ms = Marksheet.findAllBySj(sj)
        if(ms){
            Marksheet.deleteAll(ms)

            // Marksheet.executeUpdate("delete Marksheet m where m.st.id = ?", [stud.id]) no need to even search for available marksheet

            sj.delete()
            flash.message = "Subject deleted"
            redirect(action: "index")
        }else if(!ms){
            sj.delete()
            redirect(action: "index")
        }
        else{
            flash.message = "No such subjects";
            redirect(action: "index")
        }
    }
}
