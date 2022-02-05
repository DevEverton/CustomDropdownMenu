//
//  CustomDropDownMenu.swift
//  CustomDropdownMenu
//
//  Created by Everton Carneiro on 05/02/22.
//

import SwiftUI

struct CustomDropDownMenu: View {
    var body: some View {
        VStack {
            HStack {
                Text("Selected option")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                Spacer()
                Image(systemName: "chevron.up")
                .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color(uiColor: UIColor.systemMint))
        .cornerRadius(5)
    }
}

struct CustomDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropDownMenu()
            .padding(.horizontal)
    }
}
