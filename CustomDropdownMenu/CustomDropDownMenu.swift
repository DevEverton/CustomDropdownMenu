//
//  CustomDropdownMenu.swift
//  CustomDropdownMenu
//
//  Created by Everton Carneiro on 05/02/22.
//

import SwiftUI

struct CustomDropdownMenu: View {
    @State var isSelecting = false
    @State var selectionTitle = "Selected option"
    @State var selectedRowId = 0

    var body: some View {
        VStack {
            HStack {
                Text(selectionTitle)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                Spacer()
                Image(systemName: "chevron.down")
                .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            
            DropdownMenuItemView(isSelecting: $isSelecting, selectionId: $selectedRowId, selectiontitle: $selectionTitle, item: .init(id: 0, title: "First Item", iconImage: Image(systemName: "trash"), onSelect: {}))

        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color(uiColor: UIColor.systemIndigo))
        .cornerRadius(5)
        .onTapGesture {
            isSelecting.toggle()
        }
    }

}

struct DropdownItem: Identifiable {
    let id: Int
    let title: String
    let iconImage: Image
    let onSelect: () -> Void
}

struct DropdownMenuItemView: View {
    @Binding var isSelecting: Bool
    @Binding var selectionId: Int
    @Binding var selectiontitle: String
    
    let item: DropdownItem

    var body: some View {
        Button(action: {
            isSelecting = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                selectionId = item.id
            }
            selectiontitle = item.title
            item.onSelect()
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                    .opacity(selectionId == item.id ? 1 : 0)
                Text(item.title)
                    .font(.system(size: 16, weight: .regular, design: .rounded))

                Spacer()
                item.iconImage
            }
            .padding(.horizontal)
            .foregroundColor(.white)

        }
    }
}

struct CustomDropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropdownMenu()
            .padding(.horizontal)
    }
}
