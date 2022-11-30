//
//  ArticleDetail.swift
//  Babel Beauty
//
//  Created by Sebastian Cruz on 4/30/22.
//

/**
 * ArticleDetail displays a single article model object.
 */
import SwiftUI

struct ArticleDetail: View {
    var article: Article

    var body: some View {
        VStack {
            ArticleMetadata(article: article)
                .padding()

            Text(article.body).padding()
            Spacer()
        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: Article(
            id: "12345",
            title: "Preview",
            date: Date(),
            body: "Lorem ipsum dolor sit something something amet"
        ))
    }
}

