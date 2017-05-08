package grails

import org.springframework.dao.DataIntegrityViolationException

import java.text.DecimalFormat

class MarksheetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [marksheetInstanceList: Marksheet.list(params), marksheetInstanceTotal: Marksheet.count()]
    }

    def create() {
        [marksheetInstance: new Marksheet(params)]
    }

    def save() {
        def marksheetInstance = new Marksheet(params)
        if (!marksheetInstance.save(flush: true)) {
            render(view: "create", model: [marksheetInstance: marksheetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), marksheetInstance.id])
        redirect(action: "show", id: marksheetInstance.id)
    }

    def show(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        [marksheetInstance: marksheetInstance]
    }

    def edit(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        [marksheetInstance: marksheetInstance]
    }

    def update(Long id, Long version) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (marksheetInstance.version > version) {
                marksheetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'marksheet.label', default: 'Marksheet')] as Object[],
                          "Another user has updated this Marksheet while you were editing")
                render(view: "edit", model: [marksheetInstance: marksheetInstance])
                return
            }
        }

        marksheetInstance.properties = params

        if (!marksheetInstance.save(flush: true)) {
            render(view: "edit", model: [marksheetInstance: marksheetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), marksheetInstance.id])
        redirect(action: "show", id: marksheetInstance.id)
    }

    def delete(Long id) {
        def marksheetInstance = Marksheet.get(id)
        if (!marksheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
            return
        }


        try {
            marksheetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marksheet.label', default: 'Marksheet'), id])
            redirect(action: "show", id: id)
        }
    }
    def print(){}

    def search(){
        if(params.keyword){
            params.max = 10
            Student st = Student.findByName(params.keyword)
            def MarksheetList = Marksheet.findAllBySt(st, params)
            def MarksheetCount = Marksheet.findAllBySt(st).size()
            render(view: "list", model: [marksheetInstanceList: MarksheetList, marksheetInstanceTotal: MarksheetCount, params: params] )
        }
        else{
            redirect: "list"
        }
    }
    def finalMarksheet(){
        Student st = Student.findByBatchAndRollNo(params.batch, params.rollNo)
        def marksheet = Marksheet.findAllBySt(st)

        if(marksheet){
            int finalMarks = 0
            int finalTotalMarks = 0
            int finalPassMarks = 0
            int count = 0
            String pf
            for(int m: marksheet.marks)
            {
                    finalMarks+= m
                    if(m<32){
                        count++
                    }
            }
            if(count!=0){
                pf = "FAILED"
            }
            else{
                pf="PASSED"
            }

            for(int tm: marksheet.sj.totalMarks)
            {
                finalTotalMarks+=tm
            }
            for(int pm: marksheet.sj.passMarks){
                finalPassMarks+=pm
            }
            DecimalFormat df = new DecimalFormat("#.##");
            def percentage = Double.valueOf(df.format(finalMarks/finalTotalMarks * 100))

            render(view:"finalmarksheet", model: [marksheet: marksheet, finalMarks: finalMarks, finalTotalMarks: finalTotalMarks, finalPassMarks: finalPassMarks, percentage: percentage, count: count, pf: pf])
        }
        else{
            flash.message="No such student"
            redirect(action: "print")
        }
    }
}
