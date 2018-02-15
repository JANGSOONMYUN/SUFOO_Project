//
//  Model.swift
//  SearchBar
//
//  Created by Shinkangsan on 12/20/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

class Model: NSObject { // Model 이라는 class 를 생성
    var imageName:String = ""
    var imageType:String = ""
    var imageContent:String = ""
    var image:String = ""
    
    init(name:String,type:String,image:String,content:String) { //model 안에 있는 값들에 대하여 선언.
        self.imageName = name
        self.imageContent = content
        self.imageType = type
        self.image = image
    }
    
    
    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        
        modelAry.append(Model(name: "브라질너트", type:"seed",image: "1", content: "셀레늄이 풍부하여 항암 효과가 있다. 하루에 2알씩 먹으면 엄청난 효과를 불러온다. 과유불급이라고 많이 먹게되면 오히려 부작용이 생길 수 있으니 주의"))
        modelAry.append(Model(name: "카카오닙스",type:"other", image:"2", content:"우리나라에서 이미 보편화가 된 열매이다. 아는바와 같이 많은 효능을 가지고 있으며, 열매는 다소 먹기 불편 할 수 있다. 빻아서 가루로 만든 후 요거트나 우유에 곁들여 먹으면 먹는데에 훨씬 수월한다." ))
        modelAry.append(Model(name: "홍화씨",type:"other",image:"3",content:"보통 홍화씨를 먹게되면 씨앗인 관계로 상당히 껄끄럽고 먹기 불편하다. 시중에서는 보통 볶은 홍화씨를 판매하고있다. 홍화씨에 효능중에서 제일 유명한 것은 뼈를 붙는데에 탁월한 효과를 가지고 있다. 특히 여성들에게 좋은 효능을 가지고 있다. 생리기간떄 먹으면 많은 도움을 준다. 그러나, 부작용을 가지고 있는 부분도 있으니 주의해야한다."))
        // DOGS
        modelAry.append(Model(name:"햄프씨드",type:"seed",image:"4",content:"오메가 3 6 9 이 가장 이상적인 비율 1:3:1의 비율 함유로 혈관 건강에 좋고, 또 체내에서 합성이 힘든 필수 아미노산, 단백질 중 아르기닌 성분이 풍부하게 함유되어 있어서 노화 방지 동안 젊음과 다이어트에 도움을 줄 수 있습니다.  뿐만 아니라 항산화제 비타민E , 우울감, 무기력 증상 등과 성인병 예방 도움 되는 마그네슘 등이 다량 들어 있습니다"))
        return modelAry
    }
}





