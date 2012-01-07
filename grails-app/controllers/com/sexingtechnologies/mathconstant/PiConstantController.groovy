package com.sexingtechnologies.mathconstant

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils

class PiConstantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def filterPaneService

    def index() {
        redirect action: "list", params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [piConstantInstanceList: PiConstant.list(params), piConstantInstanceTotal: PiConstant.count()]
    }

    def filter() {
        if(!params.max) params.max = 10
        render( view:'list', model:[
                piConstantInstanceList: filterPaneService.filter( params, PiConstant ),
                piConstantInstanceTotal: filterPaneService.count( params, PiConstant),
                filterParams: FilterPaneUtils.extractFilterParams(params),
                params:params
        ] )
    }

    def create() {
        [piConstantInstance: new PiConstant(params)]
    }

    def save() {
        def piConstantInstance = new PiConstant(params)
        if (!piConstantInstance.save(flush: true)) {
            render view: "create", model: [piConstantInstance: piConstantInstance]
            return
        }
        calculatePi(piConstantInstance.numerator,piConstantInstance.temp,piConstantInstance.denominator,
                piConstantInstance.sum,piConstantInstance.iterations)

		flash.message = message(code: 'default.created.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), piConstantInstance.id])
        redirect action: "show", id: piConstantInstance.id
    }

    def show() {
        def piConstantInstance = PiConstant.get(params.id)
        if (!piConstantInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "list"
            return
        }

        [piConstantInstance: piConstantInstance]
    }

    def edit() {
        def piConstantInstance = PiConstant.get(params.id)
        if (!piConstantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "list"
            return
        }
        calculatePi(piConstantInstance.numerator,piConstantInstance.temp,piConstantInstance.denominator,
                piConstantInstance.sum,piConstantInstance.iterations)
        [piConstantInstance: piConstantInstance]
    }

    def update() {
        def piConstantInstance = PiConstant.get(params.id)
        if (!piConstantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "list"
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (piConstantInstance.version > version) {
                piConstantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'piConstant.label', default: 'PiConstant')] as Object[],
                          "Another user has updated this PiConstant while you were editing")
                render view: "edit", model: [piConstantInstance: piConstantInstance]
                return
            }
        }

        piConstantInstance.properties = params

        if (!piConstantInstance.save(flush: true)) {
            render view: "edit", model: [piConstantInstance: piConstantInstance]
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), piConstantInstance.id])
        redirect action: "show", id: piConstantInstance.id
    }

    def delete() {
        def piConstantInstance = PiConstant.get(params.id)
        if (!piConstantInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "list"
            return
        }

        try {
            piConstantInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "list"
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'piConstant.label', default: 'PiConstant'), params.id])
            redirect action: "show", id: params.id
        }
    }

    def calculatePi(double numerator, double temp, double denominator, double sum, long iterations) {
        def counter = 0, i = 0
        while (i < iterations) {
            numerator = -numerator
            temp = numerator
            temp /= denominator
            sum += temp
            denominator += 2
            counter++
            if(counter > 10000000) {
                render(sprintf("<p>denom: 1/%.0f pi/4: %19.17f<br>", denominator, sum))
//                printf()
                counter = 0
                i++
            }
        }
//                printf()
    }
}
