package grails

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class StudentController extends BaseController {

    def index() {
        params.max=2
        def studentList = Student.list(params)
        [sList: studentList, totalCount:Student.count()]
    }
    //def scaffold = true;
    def create(){

    }

    def search(){
        if(params.keyword){

            params.max = 2
            def studentList = Student.findAllByNameIlike(params.keyword+"%", params)
            def studentCount = Student.findAllByNameIlike(params.keyword+"%").size()
            render (view: "index", model:[sList: studentList, totalCount: studentCount, params: params])
        }
        else{
            redirect: "index"
        }
    }
    def save(){
        uploadImage(params)
        def student = new Student(params);
        if(student.save()){
            redirect(action: "index")
        }
        else{
            redirect(action: "create")
        }
    }

    def uploadImage(params){
        String path = grailsApplication.mainContext.servletContext.getRealPath("")

        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("studentImage")

        if(!file.getOriginalFilename()){
            params.imagefile = params.hiddenImage
        }
        else{
            params.imagefile = file.getOriginalFilename()
        }
        if(file){
            try{
            file.transferTo(new File(path+"/images/StudentImage/${params.imagefile}"))}
            catch (IOException){

            }
            params.image = params.imagefile
            params.remove("studentImage")
        }
    }
    def edit(){
        def student = Student.get(params.id);
        [studentInfo: student]
    }
    def update(){
        uploadImage(params)
        def student = Student.get(params.id)
        student.name = params.name
        student.address = params.address
        student.email = params.email
        student.phone = params.phone
        student.rollNo = params.rollNo
        student.batch = params.batch
        student.image = params.image

        if(student.save()){
            flash.message = "Student updated";
            redirect(action: "index")
        }
        else{
            flash.message = "No such student";
            render(view: "edit", model:[studentInfo: student])
        }
    }
    def delete(){
        Student st = Student.get(params.id)
        def ms = Marksheet.findAllBySt(st)
        if(ms){
            Marksheet.deleteAll(ms)
            st.delete()
            redirect(action: "index")
        }else if(!ms){
            st.delete()
            redirect(action: "index")
        }
        else
        {
            flash.message = "No such subject";
            redirect(action: "index")
        }
    }
}
