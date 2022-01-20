import{_ as v,g as B,a as j,b as D,c as V,M as O,d as H}from"./index.7ed9750f.js";import{d as _,n as y,h as S,f as w,o,a as n,s as p,F as m,w as f,ac as h,e,y as $,g as Y,t as c,l as g,b as z}from"./vendor.a1f70484.js";var b=_({name:"TaskCreateButton",components:{MyButton:v},async setup(){const t=await y().currentUser.getIdToken(!0),s=await B(t);let l=S();return{tasks:s,selectedTask:l}},methods:{setTask:function(t){this.$emit("set-task",t)}}});function I(t,s,l,d,u,r){const a=w("my-button");return o(!0),n(m,null,p(t.tasks,i=>(o(),n(a,{key:i.id,category:"secondary",text:i.chore_name,class:"tw-w-full tw-shadow tw-my-1",onClick:k=>t.setTask(i)},null,8,["text","onClick"]))),128)}b.render=I;var T=_({name:"ModalTaskCreate",components:{ModalBase:j,MyButton:v,TaskCreateButtons:b},props:{isVisible:{type:Boolean,required:!0,default:!1}},data(){return{selectedTask:null}},methods:{close:function(){this.$emit("close")},setTask:function(t){console.log(t)}}});const N=e("p",{class:"tw-mb-3"},"\u8FFD\u52A0\u3059\u308B\u5BB6\u4E8B\u3092\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044\u3002",-1);function U(t,s,l,d,u,r){const a=w("task-create-buttons"),i=w("modal-base");return o(),n(i,{class:"tw-text-center","is-visible":t.isVisible,onClose:s[2]||(s[2]=k=>t.close()),"is-close-button-visible":!0},{default:f(()=>[N,(o(),n(h,null,{default:f(()=>[e(a,{onSetTask:s[1]||(s[1]=k=>t.setTask(k))})]),_:1}))]),_:1},8,["is-visible"])}T.render=U;var M=_({name:"TodayTask",async setup(){const t=$(new Date),s=t.format("ddd"),l=t.format("YYYY-MM-DD"),d=await y().currentUser.getIdToken(!0);return{tasks:await D(d),weekday:s,today:l}}});const A={class:"tw-w-full tw-bg-secondary tw-rounded-lg tw-shadow-lg tw-p-5 tw-mt-5"},F={class:"tw-flex tw-items-center tw-mb-3"},q={class:"tw-w-14 tw-h-14 tw-rounded-full tw-justify-center tw-bg-gray-100 tw-flex tw-items-center"},L={class:"tw-ml-3 tw-w-2/3 tw-text-left"},P={class:"tw-mb-1"},R={key:0,class:"tw-p-3 tw-mb-3"},E=e("div",{class:"tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3"},[e("svg",{class:"tw-h-5 tw-w-5 tw-text-gray-800 tw-mx-auto",width:"24",height:"24",viewBox:"0 0 24 24","stroke-width":"2",stroke:"currentColor",fill:"none","stroke-linecap":"round","stroke-linejoin":"round"},[e("path",{stroke:"none",d:"M0 0h24v24H0z"}),e("line",{x1:"12",y1:"5",x2:"12",y2:"19"}),e("line",{x1:"5",y1:"12",x2:"19",y2:"12"})])],-1);function G(t,s,l,d,u,r){return o(),n("div",A,[Y(c(t.task)+" ",1),e("div",F,[e("div",q,c(t.weekday),1),e("div",L,[e("div",P,c(t.today),1)])]),e("div",null,[t.tasks.length===0?(o(),n("div",R,"\u4ECA\u65E5\u306E\u5BB6\u4E8B\u306F\u3042\u308A\u307E\u305B\u3093")):g("",!0),(o(!0),n(m,null,p(t.tasks,a=>(o(),n("div",{key:a,class:"tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3"},c(a.chore_name),1))),128)),E])])}M.render=G;var x=_({name:"WeekTask",async setup(){const t=await y().currentUser.getIdToken(!0),s=await V(t),l=Array.from(new Set(s.map(r=>r.start_time))),d=function(r){return $(r).format("ddd")};return{groups:l.map(r=>{const a=s.filter(i=>i.start_time===r);return{td:r,tasks:a}}),getDayOfWeek:d}}});const J={class:"tw-flex tw-items-center tw-mb-3"},K={class:"tw-w-14 tw-h-14 tw-rounded-full tw-justify-center tw-bg-gray-100 tw-flex tw-items-center"},Q={class:"tw-ml-3 tw-w-2/3 tw-text-left"},X={class:"tw-mb-1"},Z=e("div",{class:"tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3"},[e("svg",{class:"tw-h-5 tw-w-5 tw-text-gray-800 tw-mx-auto",width:"24",height:"24",viewBox:"0 0 24 24","stroke-width":"2",stroke:"currentColor",fill:"none","stroke-linecap":"round","stroke-linejoin":"round"},[e("path",{stroke:"none",d:"M0 0h24v24H0z"}),e("line",{x1:"12",y1:"5",x2:"12",y2:"19"}),e("line",{x1:"5",y1:"12",x2:"19",y2:"12"})])],-1);function tt(t,s,l,d,u,r){return o(!0),n(m,null,p(t.groups,a=>(o(),n("div",{key:a.td,class:"tw-w-full tw-bg-secondary tw-rounded-lg tw-shadow-lg tw-p-5 tw-mt-5"},[e("div",J,[e("div",K,c(t.getDayOfWeek(a.td)),1),e("div",Q,[e("div",X,c(a.td),1)])]),e("div",null,[(o(!0),n(m,null,p(a.tasks,i=>(o(),n("div",{key:i.id,class:"tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3"},c(i.chore_name),1))),128)),Z])]))),128)}x.render=tt;const et=_({name:"TaskView",components:{MyCard:O,ModalHouseWorkDiagnosis:H,ModalTaskCreate:T,WeekTask:x,TodayTask:M},setup(){const t=z({showPopup:!1,viewMode:"today",isHouseWorkDiagnosisModalOpen:!1,isTaskCreateModalOpen:!1});return{state:t,toggleViewMode:()=>{t.viewMode=t.viewMode==="today"?"week":"today"}}}});var st=et;const ot={key:0,class:"tw-text-center tw-px-5"},nt={class:"tw-flex tw-items-center tw-justify-center"},at=e("div",null,"\u4ECA\u65E5",-1),it=e("polyline",{points:"9 18 15 12 9 6"},null,-1),rt={key:1,class:"tw-text-center tw-px-5"},lt={class:"tw-flex tw-items-center tw-justify-center"},dt=e("path",{stroke:"none",d:"M0 0h24v24H0z"},null,-1),wt=e("polyline",{points:"15 6 9 12 15 18"},null,-1),ct=e("div",null,"\u4ECA\u9031",-1);function ut(t,s,l,d,u,r){const a=w("modal-house-work-diagnosis"),i=w("modal-task-create"),k=w("TodayTask"),C=w("WeekTask");return o(),n(m,null,[e(a,{"is-visible":t.state.isHouseWorkDiagnosisModalOpen,onClose:s[1]||(s[1]=()=>{t.state.isHouseWorkDiagnosisModalOpen=!1})},null,8,["is-visible"]),e(i,{"is-visible":t.state.isTaskCreateModalOpen,onClose:s[2]||(s[2]=()=>{t.state.isTaskCreateModalOpen=!1})},null,8,["is-visible"]),t.state.viewMode==="today"?(o(),n("div",ot,[e("div",nt,[at,(o(),n("svg",{onClick:s[3]||(s[3]=W=>t.toggleViewMode()),class:"tw-h-5 tw-w-5 tw-text-gray-800 tw-ml-5",viewBox:"0 0 24 24",fill:"none",stroke:"currentColor","stroke-width":"2","stroke-linecap":"round","stroke-linejoin":"round"},[it]))]),(o(),n(h,null,{default:f(()=>[e(k)]),_:1}))])):g("",!0),t.state.viewMode==="week"?(o(),n("div",rt,[e("div",lt,[(o(),n("svg",{onClick:s[4]||(s[4]=W=>t.toggleViewMode()),class:"tw-h-5 tw-w-5 tw-text-gray-800 tw-mr-5",width:"24",height:"24",viewBox:"0 0 24 24","stroke-width":"2",stroke:"currentColor",fill:"none","stroke-linecap":"round","stroke-linejoin":"round"},[dt,wt])),ct]),(o(),n(h,null,{default:f(()=>[e(C)]),_:1}))])):g("",!0)],64)}st.render=ut;export{st as default};
