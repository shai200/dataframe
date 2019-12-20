
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Elintegro Software Factory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/elintegrostartapp/assets/vuejs/tooltip.css?compile=false" />

    <script type="text/javascript" src="/elintegrostartapp/assets/jquery/jquery-1.11.2.js?compile=false" ></script>

    <script type="text/javascript" src="/elintegrostartapp/assets/jquery/dateformat.js?compile=false" ></script>



    <link rel="stylesheet" href="/elintegrostartapp/assets/vuejs/vue-material.css?compile=false" />

    <link rel="stylesheet" href="/elintegrostartapp/assets/vuejs/vuetify.min.css?compile=false" />


    <link rel="stylesheet" href="/elintegrostartapp/assets/vuejs/gc-vue.css?compile=false" />


</head>
<body>
<style>
.viewer-canvas{
    background-color: black;
}
.v-table__overflow{
    overflow-x: inherit;
    overflow-y: inherit;
}
</style>
<div id="dfr"></div>
<div id='app'><v-app style="background-color:white;"><sectionLayout/></v-app></div>


<script type="text/javascript" src="/elintegrostartapp/assets/vuejs/vue.js?compile=false" ></script>

<script type="text/javascript" src="/elintegrostartapp/assets/vuejs/vuetify.js?compile=false" ></script>

<script type="text/javascript" src="/elintegrostartapp/assets/vuejs/vue-router.js?compile=false" ></script>

<!--asset:javascript src="vuejs/vue-spring-security.min.js"/-->
<!--script type="text/javascript" src="https://unpkg.com/vue-spring-security"></script-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-resource@1.5.1"></script>
<script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.js"></script>

<script src="https://unpkg.com/popper.js"></script>
<script src="https://unpkg.com/v-tooltip"></script>
<script type="text/javascript" src="/elintegrostartapp/assets/vuejs/v-dataframe.min.js?compile=false" ></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAAxHUhrxxl_2ZSpVtGeMX-1Fs83tunNU">
</script>
<script type="text/javascript" src="/elintegrostartapp/assets/erf/erfVueController.js?compile=false" ></script>

<script type="text/javascript" src="/elintegrostartapp/assets/vuejs/vuex.js?compile=false" ></script>

<script>
    let store = new Vuex.Store({
        state:{
            dataframeShowHideMaps: {
            },
            vueInitDataframe: {
                key:''
                ,},
            vueNavigationDataframe: {
                key:''
                ,},
            vueToolbarTitleDataframe: {
                key:''
                ,},
            vueMenuDataframe: {
                key:''
                ,},
            vueBannerDataframe: {
                key:''
                ,},
            dataframeBuffer: {
            },
        },
        mutations:{
        },
    })
    Vue.component('vueInitDataframe',{
        name: 'vueInitDataframe',
        template:`<div><v-flex xs12 sm12 md12 lg12 xl12><v-form  ref='vueInitDataframe_form'><v-container grid-list-xl fluid><v-layout wrap>
 <div id='vueInitDataframe-errorContainer'></div>
</v-layout></v-container></v-form></v-flex>
</div>`,
        data: function() {return {
            namedParamKey:'',
            params:{},
        }
        },
        props: [
            'vueInitDataframe_prop' ,
        ],
        created () {
            vueInitDataframeVar = this;
            this.checkIfPopupWindow();this.setInitPageValues();
        },
        methods:{

            verifyInitDfr: function(){

            },
            closeDataframe: function(){
                console.log("vueInitDataframe dataframe close button.");
                if(this.$store.state.dataframeShowHideMaps){
                    Vue.set(this.$store.state.dataframeShowHideMaps,"vueInitDataframe_display", false);
                }
            }
            ,  checkIfPopupWindow: function(){
                var url = window.location.href;
//                           var t = url.searchParams.get("reloadPage");
//                           if(url){
//                               window.opener.location.reload();
//                               close();
//                           }
            },
            setInitPageValues:function(data){

                axios.get('/elintegrostartapp/login/getUserInfo').then(function (responseData) {
                    drfExtCont.saveToStore("vueInitDataframe", "key", '');
                    drfExtCont.saveToStore("vueProfileMenuDataframe", "key", '');
                    drfExtCont.saveToStore("vueInitDataframe", "loggedIn", responseData.data.loggedIn);
                    drfExtCont.saveToStore("loggedIn", responseData.data.loggedIn);
//                                                     vueInitDataframeVar.$store.state.vueInitDataframe = responseData.data;
//                                                     Vue.set(vueInitDataframeVar.$store.state.vueInitDataframe, "key", '');
//                                                     Vue.set(vueInitDataframeVar.$store.state.vueProfileMenuDataframe, "key", '');
                    var loggedIn = responseData.data.loggedIn
//                                                     vueInitDataframeVar.$store.state.loggedIn = loggedIn;
                    var urlLocation = window.location.href;
                    if(loggedIn == false){
//                                                        vueInitDataframeVar.$router.push("/");this.location.reload();
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            } ,


        },
    })

    Vue.component('vueNavigationDataframe',{
        name: 'vueNavigationDataframe',
        template:`<v-toolbar color="white" flat tabs style = "z-index:99;">
                                          <v-toolbar-side-icon></v-toolbar-side-icon>
                                          <v-toolbar-title style="position:fixed;">
                                                  <vueToolbarTitleDataframe/>
                                          </v-toolbar-title>
                                          <v-spacer></v-spacer>
                                          <vueMenuDataframe/>
                                          <vueInitDataframe/>
                             </v-toolbar>`,
        data: function() {return {
            namedParamKey:'',
            params:{},
        }
        },
        props: [
            'vueNavigationDataframe_prop' ,
        ],
        created () {
            this.vueNavigationDataframe_fillInitData();
            vueNavigationDataframeVar = this;
        },
        watch: {
            vueNavigationDataframe_prop: {
                deep:true,
                handler: function(){
                    this.vueNavigationDataframe_fillInitData();
                }
            },

        },
        methods:{

            vueNavigationDataframe_fillInitData: function(){
                if(this.namedParamKey == '' || this.namedParamKey == undefined){
                    if(this.vueNavigationDataframe_prop && this.vueNavigationDataframe_prop.hasOwnProperty('key')){
                        this.namedParamKey = "this.vueNavigationDataframe_prop.key?this.vueNavigationDataframe_prop.key:this.$store.state.vueNavigationDataframe.key";
                    } else{
                        this.namedParamKey = "this.$store.state.vueNavigationDataframe.key";
                    }

                }

                var allParams = {};

                allParams["id"] = eval(this.namedParamKey);

                allParams['dataframe'] = 'vueNavigationDataframe';

                axios.get('/elintegrostartapp/dataframe/ajaxValues', {
                    params: allParams
                }).then(function (responseData) {
                    var response = responseData.data;
                    if(response.data != null && response.data != '' && response.data  != undefined){
                        vueNavigationDataframeVar.vueNavigationDataframe_populateJSONData(response.data);
                    }

                    const stateVar = "vueNavigationDataframeVar.$store.state";
                    vueNavigationDataframeVar.updateStoreState(response, stateVar);
                })
                    .catch(function (error) {
                        console.log(error);
                    });
            },



            updateStoreState: function(response, stateVar){

                var dataframe = response.dataframe;
                let stateVarDf = stateVar+"."+dataframe;
                var response = response.data
                let id = response.keys["id"];
                let stateVarObj1 = eval(stateVarDf);

                if(stateVarObj1){
                    Vue.set(eval(' stateVarObj1'), 'key', id);
                }
                if(response.hasOwnProperty('additionalData') ) {
                    Object.keys(response.additionalData).forEach(function (key) {
                        var embDfr = response.additionalData[key];
                        if (embDfr.hasOwnProperty('data')){
                            if (embDfr.data.hasOwnProperty('additionalData') && embDfr.data.additionalData.data) {

                                vueNavigationDataframeVar.updateStoreState(embDfr, stateVar)
                            } else {
                                dataframe = embDfr.dataframe;
                                if(dataframe){

                                    let stateVarDf =stateVar + "." + dataframe;
                                    if(embDfr.data.hasOwnProperty('keys')){
                                        let id = embDfr.data.keys["id"];
                                        let stateVarObj2 = eval(stateVarDf);
                                        if(stateVarObj2){
                                            Vue.set(eval('stateVarObj2'), 'key', id);
                                            let propKey = "vueNavigationDataframeVar." + dataframe + "_data";
                                            Vue.set(eval(propKey), 'key', id);
                                        }
                                    }

                                }
                            }
                        }

                    });
                }
            },


            vueNavigationDataframe_populateJSONData: function(response){
            },

            verifyInitDfr: function(){

            },
            closeDataframe: function(){
                console.log("vueNavigationDataframe dataframe close button.");
                if(this.$store.state.dataframeShowHideMaps){
                    Vue.set(this.$store.state.dataframeShowHideMaps,"vueNavigationDataframe_display", false);
                }
            }
            ,},
    })

    Vue.component('vueToolbarTitleDataframe',{
        name: 'vueToolbarTitleDataframe',
        template:`<div><v-flex xs12 sm12 md12 lg12 xl12><v-form  ref='vueToolbarTitleDataframe_form'><v-container grid-list-xl fluid><v-layout wrap>

						<v-flex xs12 sm12 md12 lg12 xs12  ><v-img
           id = "vueToolbarTitleDataframe_logo"
          :src="vueToolbarTitleDataframe_logo"

          :alt = "vueToolbarTitleDataframe_logo_alt"
          aspect-ratio="2.75"

           height=auto
           width=180px
          contain ></v-img></v-flex>
	 <div id='vueInitDataframe-errorContainer'></div>
</v-layout></v-container></v-form></v-flex>
</div>`,
        data: function() {return {
            vueToolbarTitleDataframe_logo:'/elintegrostartapp/assets/logo.png',

            vueToolbarTitleDataframe_logo_alt:'',
            namedParamKey:'',
            params:{},
        }
        },
        props: [
            'vueToolbarTitleDataframe_prop' ,
        ],
        created () {
            vueToolbarTitleDataframeVar = this;
        },
        methods:{

            verifyInitDfr: function(){

            },
            closeDataframe: function(){
                console.log("vueToolbarTitleDataframe dataframe close button.");
                if(this.$store.state.dataframeShowHideMaps){
                    Vue.set(this.$store.state.dataframeShowHideMaps,"vueToolbarTitleDataframe_display", false);
                }
            }
            ,},
    })

    Vue.component('vueMenuDataframe',{
        name: 'vueMenuDataframe',
        template:`<v-toolbar-items>
                                        <v-card-actions><v-container fluid grid-list-lg pa-0><v-layout row justify-center  pa-2>
<v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Home' @click.prevent='vueMenuDataframe_Home' >Home</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Clients_Projects' @click.prevent='vueMenuDataframe_Clients_Projects' >Clients_Projects</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Technologies' @click.prevent='vueMenuDataframe_Technologies' >Technologies</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Getting_Started' @click.prevent='vueMenuDataframe_Getting_Started' >Getting_Started</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Carrers' @click.prevent='vueMenuDataframe_Carrers' >Carrers</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Contact_Us' @click.prevent='vueMenuDataframe_Contact_Us' >Contact_Us</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Login' @click.prevent='vueMenuDataframe_Login' >Login</v-btn>
</v-flex><v-flex xs12 sm12 md4 lg4 xl4 > <v-btn href='null' class='text-capitalize ' flat id='vueMenuDataframe-Register' @click.prevent='vueMenuDataframe_Register' >Register</v-btn>
</v-flex></v-layout></v-container></v-card-actions>
 <font color='red'><div id='vueMenuDataframe-errorContainer'></div></font>

                                </v-toolbar-items>`,
        data: function() {return {
            namedParamKey:'',
            params:{},
        }
        },
        props: [
            'vueMenuDataframe_prop' ,
        ],
        created () {
            this.vueMenuDataframe_fillInitData();
            vueMenuDataframeVar = this;
        },
        watch: {
            vueMenuDataframe_prop: {
                deep:true,
                handler: function(){
                    this.vueMenuDataframe_fillInitData();
                }
            },

        },
        methods:{

            vueMenuDataframe_Home: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Clients_Projects: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Technologies: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Getting_Started: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Carrers: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Contact_Us: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Login: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_Register: function(){
                var allParams = {'dataframe':'vueMenuDataframe'};


            },


            vueMenuDataframe_fillInitData: function(){
                if(this.namedParamKey == '' || this.namedParamKey == undefined){
                    if(this.vueMenuDataframe_prop && this.vueMenuDataframe_prop.hasOwnProperty('key')){
                        this.namedParamKey = "this.vueMenuDataframe_prop.key?this.vueMenuDataframe_prop.key:this.$store.state.vueMenuDataframe.key";
                    } else{
                        this.namedParamKey = "this.$store.state.vueMenuDataframe.key";
                    }

                }

                var allParams = {};

                allParams["id"] = eval(this.namedParamKey);

                allParams['dataframe'] = 'vueMenuDataframe';

                axios.get('/elintegrostartapp/dataframe/ajaxValues', {
                    params: allParams
                }).then(function (responseData) {
                    var response = responseData.data;
                    if(response.data != null && response.data != '' && response.data  != undefined){
                        vueMenuDataframeVar.vueMenuDataframe_populateJSONData(response.data);
                    }

                    const stateVar = "vueMenuDataframeVar.$store.state";
                    vueMenuDataframeVar.updateStoreState(response, stateVar);
                })
                    .catch(function (error) {
                        console.log(error);
                    });
            },



            updateStoreState: function(response, stateVar){

                var dataframe = response.dataframe;
                let stateVarDf = stateVar+"."+dataframe;
                var response = response.data
                let id = response.keys["id"];
                let stateVarObj1 = eval(stateVarDf);

                if(stateVarObj1){
                    Vue.set(eval(' stateVarObj1'), 'key', id);
                }
                if(response.hasOwnProperty('additionalData') ) {
                    Object.keys(response.additionalData).forEach(function (key) {
                        var embDfr = response.additionalData[key];
                        if (embDfr.hasOwnProperty('data')){
                            if (embDfr.data.hasOwnProperty('additionalData') && embDfr.data.additionalData.data) {

                                vueMenuDataframeVar.updateStoreState(embDfr, stateVar)
                            } else {
                                dataframe = embDfr.dataframe;
                                if(dataframe){

                                    let stateVarDf =stateVar + "." + dataframe;
                                    if(embDfr.data.hasOwnProperty('keys')){
                                        let id = embDfr.data.keys["id"];
                                        let stateVarObj2 = eval(stateVarDf);
                                        if(stateVarObj2){
                                            Vue.set(eval('stateVarObj2'), 'key', id);
                                            let propKey = "vueMenuDataframeVar." + dataframe + "_data";
                                            Vue.set(eval(propKey), 'key', id);
                                        }
                                    }

                                }
                            }
                        }

                    });
                }
            },


            vueMenuDataframe_populateJSONData: function(response){
            },

            verifyInitDfr: function(){

            },
            closeDataframe: function(){
                console.log("vueMenuDataframe dataframe close button.");
                if(this.$store.state.dataframeShowHideMaps){
                    Vue.set(this.$store.state.dataframeShowHideMaps,"vueMenuDataframe_display", false);
                }
            }
            ,},
    })

    Vue.component('vueBannerDataframe',{
        name: 'vueBannerDataframe',
        template:`<div><v-flex xs12 sm12 md12 lg12 xl12><v-form  ref='vueBannerDataframe_form'><v-container grid-list-xl fluid><v-layout wrap>

						<v-flex xs12 sm12 md12 lg12 xl12  ><v-img
           id = "vueBannerDataframe_banner"
          :src="vueBannerDataframe_banner"

          :alt = "vueBannerDataframe_banner_alt"
          aspect-ratio="2.75"

           height=auto

           ></v-img></v-flex>
	 <div id='vueInitDataframe-errorContainer'></div>
</v-layout></v-container></v-form></v-flex>
</div>`,
        data: function() {return {
            vueBannerDataframe_banner:'/elintegrostartapp/assets/banner.jpg',

            vueBannerDataframe_banner_alt:'banner',
            namedParamKey:'',
            params:{},
        }
        },
        props: [
            'vueBannerDataframe_prop' ,
        ],
        created () {
            vueBannerDataframeVar = this;
        },
        methods:{

            verifyInitDfr: function(){

            },
            closeDataframe: function(){
                console.log("vueBannerDataframe dataframe close button.");
                if(this.$store.state.dataframeShowHideMaps){
                    Vue.set(this.$store.state.dataframeShowHideMaps,"vueBannerDataframe_display", false);
                }
            }
            ,},
    })

    Vue.component('navigationLayout',{
        name: 'navigationLayout',
        template:`<v-toolbar color="white" flat tabs style = "z-index:99;">
                                          <v-toolbar-side-icon></v-toolbar-side-icon>
                                          <v-toolbar-title style="position:fixed;">
                                                  <vueToolbarTitleDataframe/>
                                          </v-toolbar-title>
                                          <v-spacer></v-spacer>
                                          <vueMenuDataframe/>
                                          <vueInitDataframe/>
                             </v-toolbar>`,
        components:{
        },
    })
    Vue.component('midSectionLayout',{
        name: 'midSectionLayout',
        template:`<div style="min-width: 1080px;">
                                   <vueBannerDataframe/>
                            </div>`,
        components:{
        },
    })
    var sectionLayoutComp = {
        template:`<v-content>
                                       <v-container fluid>
                                           <navigationLayout/>
                                           <midSectionLayout/>
                                       </v-container>
                               </v-content>`,
        components:{
        },
    }
    const router = new VueRouter({
        routes: [
        ]
    })
    var app = new Vue ({
        el:'#app',
        router,
        store,
        data(){ return {
            drawer : null,
        }
        },
        components:{
            sectionlayout : sectionLayoutComp,

        },
    })</script>
</body>
</html>
