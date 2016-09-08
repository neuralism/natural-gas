﻿package ngs.view{  import com.greensock.TweenLite;  import com.greensock.plugins.TweenPlugin;  import com.greensock.plugins.RemoveTintPlugin;  import com.greensock.easing.*;  import flash.display.MovieClip;  import flash.events.MouseEvent;  import flash.geom.Rectangle;  import ngs.model.Session;  import flash.events.EventDispatcher;  import ngs.model.NgasConsum;  public class Slider extends MovieClip   {    public var snapPointList = [ 5, 22, 38, 55, 72, 88, 105 ];    public var snapRangeList:Array = [];    public var snapSpeed:Number = 0.25;    private var _session:Session;        public var _model:*;    public var modelName:*;        public var ngasConsum:NgasConsum;        public function set session(obj:Session):void    {      TweenPlugin.activate([RemoveTintPlugin]);      _session = obj;    }        public function get session():Session    {      return _session;    }        public function set model(m:*):void    {      _model = m;            if (session != null)      {        init();      }    }        public function get model():*    {      return _model;    }    public function register():void    {      bar.def_width = bar.width;      handle.def_width = handle.width;      handle.curConsum.def_y = handle.curConsum.y;      min.def_y = min.y;      max.def_y = max.y;            bar.width = handle.width = 0;      handle.curConsum.alpha = 0;      min.alpha = max.alpha = 0;    }        public function init():void    {      init_listeners();      init_handle();      init_bar();      register();            switch (model.name)      {        case "coalConsum":          min.val.text = "-1%";          max.val.text = "5%";          handle.x = snapPointList[1];        break;                default:          min.val.text = "-2%";          max.val.text = "4%";          handle.x = snapPointList[2];      }          }        public function preTransitionState():void    {      bar.width = handle.width = 0;      TweenLite.to(bar, 0.0001, { tint: 0x666666 });      handle.curConsum.alpha = 0;      min.alpha = max.alpha = 0;    }    public function init_listeners():void    {      this.addEventListener(MouseEvent.ROLL_OVER, handler);      this.addEventListener(MouseEvent.ROLL_OUT, handler);            function handler(event:MouseEvent):void      {        switch (event.type)        {          case MouseEvent.ROLL_OVER:            TweenLite.to(bar, 0.5, { tint: 0x666666, ease: Expo.easeOut, overwrite: false });            break;          case MouseEvent.ROLL_OUT:            TweenLite.to(bar, 0.5, { removeTint: true, ease: Expo.easeOut, overwrite: false });            break;        }      }    }            public function init_handle():void    {      var bounds:Rectangle = new Rectangle(5, 0, bar.width - 10, 0);      handle.buttonMode = true;            handle.addEventListener(MouseEvent.MOUSE_DOWN, handler);            function handler(event:MouseEvent):void      {        switch (event.type)        {          case MouseEvent.MOUSE_DOWN:            handle.stage.addEventListener(MouseEvent.MOUSE_UP, handler);            handle.startDrag(false, bounds);            break;          case MouseEvent.MOUSE_UP:            handle.stage.removeEventListener(MouseEvent.MOUSE_UP, handler);            handle.stopDrag();            checkLocation(handle.x);            break;        }      }    }        public function checkLocation(value:Number):void    {      switch (true)      {        case (value < 13.2):                     TweenLite.to(min, snapSpeed, { alpha: 0, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[0], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "-1%";            model.consumption = -1;          }                    else          {            handle.curConsum.val.text = "-2%";            model.consumption = -2;          }          break;        case (value > 13.2 && value < 30):                    TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[1], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "0%";            model.consumption = 0;          }          else          {            handle.curConsum.val.text = "-1%";            model.consumption = -1;          }                    break;                case (value > 30 && value < 46.7):           TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[2], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "1%";            model.consumption = 1;          }          else          {            handle.curConsum.val.text = "0%";            model.consumption = 0;          }                    break;        case (value > 46.5 && value < 63.2):          TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[3], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "2%";            model.consumption = 2;          }          else          {            handle.curConsum.val.text = "1%";            model.consumption = 1;          }                    break;                  case (value > 63.2 && value < 79.9):          TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[4], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "3%";            model.consumption = 3;          }          else          {            handle.curConsum.val.text = "2%";            model.consumption = 2;          }          break;                  case (value > 79.9 && value < 96.5):           TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[5], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "4%";            model.consumption = 4;          }          else          {            handle.curConsum.val.text = "3%";            model.consumption = 3;          }          break;                  case (value > 96.5):          TweenLite.to(min, snapSpeed, { alpha: 1, ease: Expo.easeOut });          TweenLite.to(max, snapSpeed, { alpha: 0, ease: Expo.easeOut });          TweenLite.to(handle, snapSpeed, { x: snapPointList[6], ease: Expo.easeOut });                    if (model.name == "coalConsum")          {            handle.curConsum.val.text = "5%";            model.consumption = 5;          }          else          {            handle.curConsum.val.text = "4%";            model.consumption = 4;          }          break;      }          }        public function init_bar():void    {      bar.addEventListener(MouseEvent.MOUSE_DOWN, handler);            function handler(event:MouseEvent):void      {        checkLocation(mouseX);      }    }        public function postTransitionState():void    {      bar.width = bar.def_width;      TweenLite.to(bar, 0.00001, { removeTint: true });      handle.width = handle.def_width;      handle.curConsum.alpha = 1;      min.alpha = 1;      max.alpha = 1;    }        public function transitionIn():void    {      preTransitionState();            TweenLite.to(bar, 0.4, { width: bar.def_width, ease: Expo.easeOut, overwrite: true });      TweenLite.to(bar, 0.4, { removeTint: true, ease: Expo.easeOut, delay: 0.4 });      TweenLite.to(handle, 0.4, { width: handle.def_width, ease: Back.easeOut, delay: 0.4, overwrite: true });      TweenLite.to(handle.curConsum, 0.45, { alpha: 1, ease: Expo.easeOut, delay: 0.7, overwrite: true });            if (handle.x > 13.2 && handle.x < 96.5)      {        TweenLite.to(max, 0.25, { alpha: 1, ease: Expo.easeOut, delay: 0, overwrite: true });        TweenLite.to(min, 0.25, { alpha: 1, ease: Expo.easeOut, delay: 0, overwrite: true });      }            else if (handle.x > 96.5)      {        TweenLite.to(min, 0.25, { alpha: 1, ease: Expo.easeOut, delay: 0, overwrite: true });      }            else if (handle.x < 13.2)      {        TweenLite.to(max, 0.25, { alpha: 1, ease: Expo.easeOut, delay: 0, overwrite: true });      }    }        public function transitionOut():void    {      TweenLite.to(handle.curConsum, 0.45, { alpha: 0, ease: Expo.easeOut, overwrite: true });      TweenLite.to(bar, 0.25, { tint: 0x666666, ease: Expo.easeOut, overwrite: true });      TweenLite.to(bar, 0.4, { width: 0, ease: Expo.easeOut, delay: 0.5, overwrite: true });      TweenLite.to(handle, 0.4, { width: 0, ease: Back.easeIn, delay: 0, overwrite: true });      TweenLite.to(min, 0.25, { alpha: 0, ease: Expo.easeOut, delay: 0, overwrite: true });      TweenLite.to(max, 0.25, { alpha: 0, ease: Expo.easeOut, delay: 0, overwrite: true });    }  }}