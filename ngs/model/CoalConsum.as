﻿package ngs.model{  import ngs.model.Session;  import flash.events.Event;    public class CoalConsum extends Session  {    private var _consumption:Number = 0;    public var name:String = "coalConsum";    public static const VALUE:String = "value";        public function set consumption(val:Number):void    {      trace("set Consumption in ngas class");      _consumption = val;      dispatchEvent(new Event(CoalConsum.VALUE));    }        public function get consumption():Number    {      return _consumption;    }  }}