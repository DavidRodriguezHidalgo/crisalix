export default class AppointmentsCtrl {
    constructor() {
        this.hideNewAppointmentForm();
    }

    selectDoctor(docId){
        this.showNewAppointmentForm();
        document.querySelector('#appointment_doctor_id').value = docId
    }

    hideNewAppointmentForm(){
        document.querySelector('#new_appointment').classList.add('hidden')
        document.querySelector('#appointments_warning').classList.remove('hidden')
    }

    showNewAppointmentForm(){
        document.querySelector('#new_appointment').classList.remove('hidden')
        document.querySelector('#appointments_warning').classList.add('hidden')
    }
}