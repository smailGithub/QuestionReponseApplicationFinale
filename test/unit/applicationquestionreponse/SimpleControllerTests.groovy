package applicationquestionreponse



import org.junit.*
import grails.test.mixin.*

@TestFor(SimpleController)
@Mock(Simple)
class SimpleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/simple/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.simpleInstanceList.size() == 0
        assert model.simpleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.simpleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.simpleInstance != null
        assert view == '/simple/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/simple/show/1'
        assert controller.flash.message != null
        assert Simple.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/simple/list'

        populateValidParams(params)
        def simple = new Simple(params)

        assert simple.save() != null

        params.id = simple.id

        def model = controller.show()

        assert model.simpleInstance == simple
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/simple/list'

        populateValidParams(params)
        def simple = new Simple(params)

        assert simple.save() != null

        params.id = simple.id

        def model = controller.edit()

        assert model.simpleInstance == simple
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/simple/list'

        response.reset()

        populateValidParams(params)
        def simple = new Simple(params)

        assert simple.save() != null

        // test invalid parameters in update
        params.id = simple.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/simple/edit"
        assert model.simpleInstance != null

        simple.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/simple/show/$simple.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        simple.clearErrors()

        populateValidParams(params)
        params.id = simple.id
        params.version = -1
        controller.update()

        assert view == "/simple/edit"
        assert model.simpleInstance != null
        assert model.simpleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/simple/list'

        response.reset()

        populateValidParams(params)
        def simple = new Simple(params)

        assert simple.save() != null
        assert Simple.count() == 1

        params.id = simple.id

        controller.delete()

        assert Simple.count() == 0
        assert Simple.get(simple.id) == null
        assert response.redirectedUrl == '/simple/list'
    }
}
