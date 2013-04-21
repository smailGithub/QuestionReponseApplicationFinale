package applicationquestionreponse



import org.junit.*
import grails.test.mixin.*

@TestFor(TrueFalseController)
@Mock(TrueFalse)
class TrueFalseControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/trueFalse/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.trueFalseInstanceList.size() == 0
        assert model.trueFalseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.trueFalseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.trueFalseInstance != null
        assert view == '/trueFalse/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/trueFalse/show/1'
        assert controller.flash.message != null
        assert TrueFalse.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/trueFalse/list'

        populateValidParams(params)
        def trueFalse = new TrueFalse(params)

        assert trueFalse.save() != null

        params.id = trueFalse.id

        def model = controller.show()

        assert model.trueFalseInstance == trueFalse
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/trueFalse/list'

        populateValidParams(params)
        def trueFalse = new TrueFalse(params)

        assert trueFalse.save() != null

        params.id = trueFalse.id

        def model = controller.edit()

        assert model.trueFalseInstance == trueFalse
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/trueFalse/list'

        response.reset()

        populateValidParams(params)
        def trueFalse = new TrueFalse(params)

        assert trueFalse.save() != null

        // test invalid parameters in update
        params.id = trueFalse.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/trueFalse/edit"
        assert model.trueFalseInstance != null

        trueFalse.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/trueFalse/show/$trueFalse.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        trueFalse.clearErrors()

        populateValidParams(params)
        params.id = trueFalse.id
        params.version = -1
        controller.update()

        assert view == "/trueFalse/edit"
        assert model.trueFalseInstance != null
        assert model.trueFalseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/trueFalse/list'

        response.reset()

        populateValidParams(params)
        def trueFalse = new TrueFalse(params)

        assert trueFalse.save() != null
        assert TrueFalse.count() == 1

        params.id = trueFalse.id

        controller.delete()

        assert TrueFalse.count() == 0
        assert TrueFalse.get(trueFalse.id) == null
        assert response.redirectedUrl == '/trueFalse/list'
    }
}
