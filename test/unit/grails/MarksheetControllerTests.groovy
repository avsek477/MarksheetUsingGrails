package grails



import org.junit.*
import grails.test.mixin.*

@TestFor(MarksheetController)
@Mock(Marksheet)
class MarksheetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/marksheet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.marksheetInstanceList.size() == 0
        assert model.marksheetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.marksheetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.marksheetInstance != null
        assert view == '/marksheet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/marksheet/show/1'
        assert controller.flash.message != null
        assert Marksheet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/marksheet/list'

        populateValidParams(params)
        def marksheet = new Marksheet(params)

        assert marksheet.save() != null

        params.id = marksheet.id

        def model = controller.show()

        assert model.marksheetInstance == marksheet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/marksheet/list'

        populateValidParams(params)
        def marksheet = new Marksheet(params)

        assert marksheet.save() != null

        params.id = marksheet.id

        def model = controller.edit()

        assert model.marksheetInstance == marksheet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/marksheet/list'

        response.reset()

        populateValidParams(params)
        def marksheet = new Marksheet(params)

        assert marksheet.save() != null

        // test invalid parameters in update
        params.id = marksheet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/marksheet/edit"
        assert model.marksheetInstance != null

        marksheet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/marksheet/show/$marksheet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        marksheet.clearErrors()

        populateValidParams(params)
        params.id = marksheet.id
        params.version = -1
        controller.update()

        assert view == "/marksheet/edit"
        assert model.marksheetInstance != null
        assert model.marksheetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/marksheet/list'

        response.reset()

        populateValidParams(params)
        def marksheet = new Marksheet(params)

        assert marksheet.save() != null
        assert Marksheet.count() == 1

        params.id = marksheet.id

        controller.delete()

        assert Marksheet.count() == 0
        assert Marksheet.get(marksheet.id) == null
        assert response.redirectedUrl == '/marksheet/list'
    }
}
