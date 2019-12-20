package spring.ElintegroWebsite

import com.elintegro.erf.dataframe.vue.DataframeVue
import grails.util.Holders

beans {

    vueInitDataframe(DataframeVue){bean ->
        bean.parent = dataFrameSuper
        bean.constructorArgs = ['vueInitDataframe']
        saveButton = false
        wrapInForm=false
        initOnPageLoad = false
        isGlobal = true
        putFillInitDataMethod = false
        currentFrameLayout = ref("emptyDataframeLayout")
    }
    vueNavigationDataframe(DataframeVue){bean->
        bean.parent = dataFrameSuper
        bean.constructorArgs = ['vueNavigationDataframe']
        saveButton = false
        isGlobal = true
        currentFrameLayout= ref("navigationLayout")

    }
    vueToolbarTitleDataframe(DataframeVue){bean->
        bean.parent = dataFrameSuper
        bean.constructorArgs = ['vueToolbarTitleDataframe']
        saveButton = false
        isGlobal = true
        initOnPageLoad = false
        addFieldDef =[
                "logo":[
                        "widget" : "PictureDisplayWidgetVue",
                        "url": "/elintegrostartapp/assets/logo.png",
                        "flexGridValues" : ['xs12','sm12','md12','lg12','xs12'],
                        attr:"contain",
                        height:"auto",
                        width:"200px"
                ]
        ]
        currentFrameLayout = ref("emptyDataframeLayout")
    }
    vueMenuDataframe(DataframeVue){ bean->
        bean.parent = dataFrameSuper
        bean.constructorArgs = ['vueMenuDataframe']
        saveButton = false
        dataframeButtons = [
                            Home:[name:"Home",type:"link"],
                            Clients_Projects:[name:"Clients & Projects",type:"link"],
                            Technologies:[name:"Technologies",type:"link"],
                            Getting_Started:[name:"Getting Started",type:"link"],
                            Carrers:[name:"careers",type:"link"],
                            Contact_Us:[name:"Contact Us",type: "link"],
                            Login:[name:"login",type:"link"],
                            Register:[name:"register",type: "link"]
                            ]
        isGlobal = true
        wrapButtons = false
        currentFrameLayout = ref("toolbarOfNavigationLayout")
    }
    vueBannerDataframe(DataframeVue){bean->
        bean.parent = dataFrameSuper
        bean.constructorArgs = ['vueBannerDataframe']
        isGlobal = true
        saveButton = false
        initOnPageLoad = false
        addFieldDef =[
                "banner":[
                        "widget" : "PictureDisplayWidgetVue",
                        "url":"/elintegrostartapp/assets/banner.jpg",
                        "alt":"banner",
                        "height": "auto",
                        "flexGridValues":['xs12', 'sm12', 'md12', 'lg12', 'xl12']
                        /*"attr": "style='min-width:370px' "*/
                        ]
                ]
        currentFrameLayout = ref("emptyDataframeLayout")
    }

}
