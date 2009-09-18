package com.coravy.remoting.dto {
    
    import mx.collections.ArrayCollection;
    import mx.utils.ObjectUtil;
    
    
    [Bindable]
    [RemoteClass(alias="com.coravy.store.model.Category")]
    public class Category {
        private var _id:int;
        private var _label:String;
        private var _parent:Category;
        private var _children:ArrayCollection;
        
        public function set id(id:int):void {
        	this._id = id;
        }
        
        public function get id():int {
        	return this._id;
        }
        
        public function set label(l:String):void {
        	this._label = l;
        }
        
        public function get label():String {
        	return this._label;
        }
        
        public function set parent(p:Category):void {
        	this._parent = p;
        }
        
        public function get parent():Category {
        	return this._parent;
        }
        
        public function set children(c:ArrayCollection):void {
        	this._children = c;
        }
        
        public function get children():ArrayCollection {
        	return this._children;
        }
        

        public function toString():String {
            return ObjectUtil.toString(this); 
        }
    }
}