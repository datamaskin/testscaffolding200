package com.sexingtechnologies.mathconstant

class PiConstant extends AbstractMathConstant {

    static scaffold = [
            exclude: ['temp'],
            showInList: ['sum', 'denominator', 'numerator', 'iterations']
    ]

    double sum = 1.0
    double denominator = 3.0
    double numerator = 1.0

    static belongsTo = AbstractMathConstant

    static constraints = {
    }

}
