package elintegroWebsite
class ElintegroWebsiteController {

    def index(){}
    def ContactUs(){
        ContactUs contactUs = new ContactUs(params)
        contactUs.name =params.get("vueContactUsPageDataframe-name")
        contactUs.email = params.get("vueContactUsPageDataframe-email")
        contactUs.phone = params.get("vueContactUsPageDataframe-phone")
        contactUs.message = params.get("vueContactUsPageDataframe-message")
        contactUs.save()
    }

}
