package spring.elintegroWebsite

import com.elintegro.erf.layout.ColumnLayoutVue
import com.elintegro.erf.layout.RowLayoutVue

beans {
    emptyDataframeLayout(ColumnLayoutVue){bean ->
        layoutBeanName = bean.name
        layoutPlaceHolder = """<div>[DATAFRAME_SCRIPT]</div>"""
    }
    vueElintegroContainerLayout(ColumnLayoutVue){bean ->
        layoutBeanName = bean.name
        layoutPlaceHolder = """<div id='app'><v-app style="background-color:white;"><sectionLayout/></v-app></div>"""
        children = ["sectionLayout"]
    }
    sectionLayout(RowLayoutVue){ bean->
        layoutBeanName = bean.name
        layoutPlaceHolder = """<v-content>
                                       <v-container fluid>   
                                           <navigationLayout/>
                                           <midSectionLayout/>
                                       </v-container>
                               </v-content>"""
        children = ["navigationLayout","midSectionLayout"]
    }
    navigationLayout(RowLayoutVue){bean ->
        layoutBeanName = bean.name
        layoutPlaceHolder = """
                                <v-toolbar color="white" app flat>
                                            <v-toolbar-side-icon class="hidden-md-and-up"@click.stop="drawer = !drawer"></v-toolbar-side-icon>
                                                <vueToolbarTitleDataframe position="fixed;"/>
                                                <vueMenuDataframe/>
                                                <vueInitDataframe/>
                                </v-toolbar>"""
        isGlobal = true

    }
    toolbarOfNavigationLayout(RowLayoutVue){bean->
        layoutBeanName = bean.name
        layoutPlaceHolder = """<v-toolbar-items>
                                     <v-flex align-end layout py-2>
                                     [DATAFRAME_SCRIPT]
                                        [BUTTON_SCRIPT]
                                      </v-flex>
                              </v-toolbar-items>"""
    }
    midSectionLayout(RowLayoutVue){bean->
        layoutBeanName = bean.name
        layoutPlaceHolder ="""
                            <div style="min-width: 1080px;">
                                <v-flex xs12>
                                   <vueBannerDataframe/>
                                </v-flex>
                            </div>"""
        isGlobal = true
    }

}
