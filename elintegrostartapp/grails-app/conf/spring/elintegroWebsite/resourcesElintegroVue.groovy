package spring.ElintegroWebsite

import com.elintegro.erf.dataframe.vue.DataframeVue
import grails.util.Holders

beans {
    def contextPath = Holders.grailsApplication.config.rootPath

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
                        "url": "${contextPath}/assets/logo.png",
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
                            home:[name:"home",type:"link"],
                            clientsProjects:[name:"clientsProjects",type:"link"],
                            technologies:[name:"technologies",type:"link", url:"${contextPath}/ElintegroWeb/renderData",
                            callBackParams:[successScript:"""let url = response.url; window.open("${contextPath}"+url,'_blank');
                              """]],
                            gettingStarted:[name:"gettingStarted",type:"link"],
                            carrers:[name:"careers",type:"link"],
                            contactUs:[name:"contactUs",type: "link"],
                            login:[name:"login",type:"link"],
                            register:[name:"register",type: "link"]
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
                        "url":"${contextPath}/assets/banner.jpg",
                        "alt":"banner",
                        "height": "auto",
                        "flexGridValues":['xs12', 'sm12', 'md12', 'lg12', 'xl12']
                        /*"attr": "style='min-width:370px' "*/
                        ]
                ]
        currentFrameLayout = ref("emptyDataframeLayout")
    }

}
