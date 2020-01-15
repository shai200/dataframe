package com.elintegro.elintegrostartapp.hr

import com.elintegro.elintegrostartapp.client.Application

class ApplicationSkill extends Skills {
    Application application
    String skill
    Short level /*1 to 5 */
    String comment

    static constraints = {
        application(nullable: false)
        skill(nullable: false)
        comment(nullable: false)
    }
}