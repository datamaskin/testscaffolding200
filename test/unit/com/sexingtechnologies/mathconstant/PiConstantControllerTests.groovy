package com.sexingtechnologies.mathconstant


import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(PiConstantController)
@Mock(PiConstant)
class PiConstantControllerTests {

    def populateValidParams(params) {
        assert params != null
// TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/piConstant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.piConstant
        InstanceList.size() == 0
        assert model.piConstant
        InstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.piConstant
        Instance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.piConstant
        Instance != null
        assert view == '/piConstant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/piConstant/show/1'
        assert controller.flash.message != null
        assert PiConstant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/piConstant/list'


        populateValidParams(params)
        def piConstant = new PiConstant(params)

        assert piConstant.save() != null

        params.id = piConstant.id

        def model = controller.show()

        assert model.piConstantInstance == piConstant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/piConstant/list'


        populateValidParams(params)
        def piConstant = new PiConstant(params)

        assert piConstant.save() != null

        params.id = piConstant.id

        def model = controller.edit()

        assert model.piConstantInstance == piConstant
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/piConstant/list'

        response.reset()


        populateValidParams(params)
        def piConstant = new PiConstant(params)

        assert piConstant.save() != null

        // test invalid parameters in update
        params.id = piConstant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/piConstant/edit"
        assert model.piConstantInstance != null

        piConstant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/piConstant/show/$piConstant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        piConstant.clearErrors()

        populateValidParams(params)
        params.id = piConstant.id
        params.version = -1
        controller.update()

        assert view == "/piConstant/edit"
        assert model.piConstant
        Instance != null
        assert model.piConstant
        Instance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/piConstant/list'

        response.reset()

        populateValidParams(params)
        def piConstant = new PiConstant(params)

        assert piConstant.save() != null
        assert PiConstant.count() == 1

        params.id = piConstant.id

        controller.delete()

        assert PiConstant.count() == 0
        assert PiConstant.get(piConstant.id) == null
        assert response.redirectedUrl == '/piConstant/list'
    }

}
