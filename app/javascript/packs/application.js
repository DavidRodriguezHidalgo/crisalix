// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import { RalixApp } from 'ralix'
import "channels"

// Controllers
import AppointmentsCtrl      from '../controller/appointments'

const App = new RalixApp({
    rails_ujs: Rails,
    routes: {
        '/appointments/new':    AppointmentsCtrl,
    },
    components: [
    ]
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()
App.start()
