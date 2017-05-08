package grails

class Student {
    String name
    String address
    String email
    String phone
    String rollNo
    String batch
    String image

    static constraints = {
        name(blank: false,nullable: false,minSize: 3)
    }
}
