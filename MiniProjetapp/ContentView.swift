//
//  ContentView.swift
//  MiniProjetapp
//
//  Created by Salsabil Racil on 11/18/20.
//

import SwiftUI



struct ContentView: View {
    @State var animate=false
    @State var andSplash=false
    var body: some View {
        
        
        
        ZStack{
       
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            if UIScreen.main.bounds.height > 800{
                
                Home()
            }
            else{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Home()
                }
            }
            
            ZStack{
            Color("bg")
            Image("logoBig")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: animate ? .fill :.fit)
                .frame(width: animate ? nil :85, height: animate ? nil :85)
                .scaleEffect(animate ? 3:1)
                .frame(width: UIScreen.main.bounds.width)
                
            
        }
        .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(andSplash ? 0 : 1)
    }
    
    }
   func animateSplash()
   {
    DispatchQueue.main.asyncAfter(deadline:.now() + 1){
        withAnimation(Animation.easeOut(duration: 1)){
            animate.toggle()
        }
        withAnimation(Animation.easeIn(duration: 1)){
            andSplash.toggle()
        }
        
    }
   }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View {
    @State var index = 0
    var body: some View {
        ZStack{
            Image("logoBig")
                          .resizable()
                          .frame(width: 200, height: 100)
                .padding(.bottom,250)
            HStack{
                             
                             Button(action: {
                                 
                                 withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                                     
                                    self.index = 0
                                 }
                                 
                             }) {
                                 
                                 Text("SignIn")
                                     .foregroundColor(self.index == 0 ? .black : .white)
                                     .fontWeight(.bold)
                                     .padding(.vertical, 10)
                                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                                 
                             }.background(self.index == 0 ? Color.white : Color.clear)
                             .clipShape(Capsule())
                             
                             Button(action: {
                                 
                                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                                    
                                   self.index = 1
                                }
                                 
                             }) {
                                 
                                 Text("SignUp")
                                     .foregroundColor(self.index == 1 ? .black : .white)
                                     .fontWeight(.bold)
                                     .padding(.vertical, 10)
                                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                                 
                             }.background(self.index == 1 ? Color.white : Color.clear)
                             .clipShape(Capsule())
                             
                         }.background(Color.black.opacity(0.1))
                         .clipShape(Capsule())
                         .padding(.top, 25)
                         
                         if self.index == 0{
                             
                             Login()
                         }
                         else{
                             
                             SignUp()
                         }
                         
                       
                  }
      
                      .padding(.bottom,200)
                      
                       
                      
                  }
                  

}
struct Login : View {
     
     @State var mail = ""
     @State var pass = ""
     
     var body : some View{
         
         VStack{
             
             VStack{
                 
                 HStack(spacing: 15){
                     
                     Image(systemName: "envelope")
                         .foregroundColor(.black)
                     
                     TextField("Enter Email Address", text: self.$mail)
                     
                 }.padding(.vertical, 20)
                 
                 Divider()
                 
                 HStack(spacing: 15){
                     
                     Image(systemName: "lock")
                     .resizable()
                     .frame(width: 15, height: 18)
                     .foregroundColor(.black)
                     
                     SecureField("Password", text: self.$pass)
                     
                     Button(action: {
                         
                     }) {
                         
                         Image(systemName: "eye")
                             .foregroundColor(.black)
                     }
                     
                 }.padding(.vertical, 20)
                 
             }
             .padding(.vertical)
             .padding(.horizontal, 25)
             .padding(.bottom, 10)
             .background(Color.white)
             .cornerRadius(10)
             .padding(.top, 280)
             
             
             Button(action: {
                 
             }) {
                 
                 Text("LOGIN")
                     .foregroundColor(.white)
                     .fontWeight(.bold)
                     .padding(.vertical)
                     .frame(width: UIScreen.main.bounds.width - 100)
                 
             }.background(
             
                 LinearGradient(gradient: .init(colors: [Color("Color")]), startPoint: .leading, endPoint: .trailing)
             )
             .cornerRadius(8)
             .offset(y: -40)
             .padding(.bottom, -40)
             .shadow(radius: 15)
         }
     }
 }
struct SignUp : View {
      
      @State var mail = ""
      @State var pass = ""
      @State var repass = ""
      
      var body : some View{
          
          VStack{
              
              VStack{
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "envelope")
                          .foregroundColor(.black)
                      
                      TextField("Enter Email Address", text: self.$mail)
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Password", text: self.$pass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Re-Enter", text: self.$repass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
              }
              .padding(.vertical)
              .padding(.horizontal, 25)
              .padding(.bottom, 10)
              .background(Color.white)
              .cornerRadius(10)
              .padding(.top, 354)
              
              
              Button(action: {
                  
              }) {
                  
                  Text("SIGNUP")
                      .foregroundColor(.white)
                      .fontWeight(.bold)
                      .padding(.vertical)
                      .frame(width: UIScreen.main.bounds.width - 100)
                  
              }.background(
              
                  LinearGradient(gradient: .init(colors: [Color("Color")]), startPoint: .leading, endPoint: .trailing)
              )
              .cornerRadius(8)
              .offset(y: -40)
              .padding(.bottom, -40)
              .shadow(radius: 15)
          }
      }
  }
