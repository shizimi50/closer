import{g as f,_ as l}from"./index.7ed9750f.js";import{d as a,o as s,a as n,t as w,n as k,f as c,s as y,F as g,e as d,ac as x,w as v}from"./vendor.a1f70484.js";var m=a({name:"MyButton",props:{text:{type:String,required:!0}}});const h={class:"tw-text-center tw-border-b tw-border-gray-100 tw-p-3"};function T(t,e,p,i,u,_){return s(),n("div",h,w(t.text),1)}m.render=T;var $=a({name:"TaskRows",components:{MyRow:m},async setup(){const t=await k().currentUser.getIdToken(!0);return{tasks:await f(t)}}});function R(t,e,p,i,u,_){const r=c("my-row");return s(!0),n(g,null,y(t.tasks,o=>(s(),n(r,{key:o.id,text:o.chore_name},null,8,["text"]))),128)}$.render=R;var b=a({name:"TaskList",components:{MyButton:l,TaskRows:$}});const B={class:"tw-p-5"};function C(t,e,p,i,u,_){const r=c("my-button"),o=c("TaskRows");return s(),n("div",B,[d(r,{onClick:e[1]||(e[1]=M=>t.$router.push("/task/create")),class:"tw-w-full",text:"+",category:"primary"}),(s(),n(x,null,{default:v(()=>[d(o)]),_:1}))])}b.render=C;export{b as default};
