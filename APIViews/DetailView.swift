//
//  DetailView.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .scale.combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
                )
    }
}

struct DetailView: View {
    var makeup: Makeup
    
    @State private var showDetail = false

    var body: some View {
        ScrollView {
            ProductImage(imageUrl: makeup.image_link ?? "")
//                .overlay {
//                    Rectangle().stroke(.black, lineWidth: 4).frame(width: 300, height: 400)
//                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .offset(y: 50)
                .padding(.bottom, 200)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(makeup.name ?? "")
                    .font(.title)
                    .bold()
                }
                
                
                HStack(alignment: .center) {
                    Text("More Information:")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            showDetail.toggle()
                        }
                    } label: {
                        Label("Graph", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .padding()
                        
                    }
                }
                
                
                
            }
            .padding()
            
            if showDetail {
                VStack(alignment: .center) {
                    
                    Text("Product Type:")
                        .font(.headline)
                    
                    Text(makeup.product_type ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("Description:")
                       .font(.headline)
                    
                    Text(makeup.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                    
                    
                }
                //.background(BadgeBackground())
                .padding()
                .transition(.moveAndFade)
            }
            
        }
        
        //.navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(makeup: Makeup(
            id: 1048,
            brand: "colourpop",
            name: "Lippie Pencil",
            product_type: "lip_liner",
            description: "Lippie Pencil A long-wearing and high-intensity lip pencil that glides on easily and prevents feathering. Many of our Lippie Stix have a coordinating Lippie Pencil designed to compliment it perfectly, but feel free to mix and match!",
            image_link: "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769"
        ))
    }
}
