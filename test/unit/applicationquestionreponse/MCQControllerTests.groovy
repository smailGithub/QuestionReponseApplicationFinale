package applicationquestionreponse



import org.junit.*
import grails.test.mixin.*

@TestFor(MCQController)
@Mock(MCQ)
class MCQControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/MCQ/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.MCQInstanceList.size() == 0
        assert model.MCQInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.MCQInstance != null
    }

    void testSave() {
        controller.save()

        assert model.MCQInstance != null
        assert view == '/MCQ/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/MCQ/show/1'
        assert controller.flash.message != null
        assert MCQ.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/MCQ/list'

        populateValidParams(params)
        def MCQ = new MCQ(params)

        assert MCQ.save() != null

        params.id = MCQ.id

        def model = controller.show()

        assert model.MCQInstance == MCQ
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/MCQ/list'

        populateValidParams(params)
        def MCQ = new MCQ(params)

        assert MCQ.save() != null

        params.id = MCQ.id

        def model = controller.edit()

        assert model.MCQInstance == MCQ
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/MCQ/list'

        response.reset()

        populateValidParams(params)
        def MCQ = new MCQ(params)

        assert MCQ.save() != null

        // test invalid parameters in update
        params.id = MCQ.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/MCQ/edit"
        assert model.MCQInstance != null

        MCQ.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/MCQ/show/$MCQ.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        MCQ.clearErrors()

        populateValidParams(params)
        params.id = MCQ.id
        params.version = -1
        controller.update()

        assert view == "/MCQ/edit"
        assert model.MCQInstance != null
        assert model.MCQInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/MCQ/list'

        response.reset()

        populateValidParams(params)
        def MCQ = new MCQ(params)

        assert MCQ.save() != null
        assert MCQ.count() == 1

        params.id = MCQ.id

        controller.delete()

        assert MCQ.count() == 0
        assert MCQ.get(MCQ.id) == null
        assert response.redirectedUrl == '/MCQ/list'
    }
}
