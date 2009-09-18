package com.coravy.remoting.dto {
    
    import mx.utils.ObjectUtil;
    
    [Bindable]
    [RemoteClass(alias="com.coravy.store.model.Product")]
    public class Product {
        public var id:int;
        public var name:String;
        public var vendor:String;
        public var weight:Number;
        public var volume:Number;
        public var stockAmount:int;
        public var category:int;
        
        
        public function toString():String {
            return ObjectUtil.toString(this); 
        }
    }
}