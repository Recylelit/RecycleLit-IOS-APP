//
//  DetailListRow.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct DetailListRow: View {
    var title: String
    var data: String
    var body: some View {
        HStack(alignment: .top){
            Text(title)
                .bold()
            Spacer()
            Text(data)
        }
        .padding(.bottom)
    }
}

//struct DetailListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailListRow()
//    }
//}
