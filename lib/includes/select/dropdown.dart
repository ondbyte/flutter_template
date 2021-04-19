import 'package:flutter/material.dart';
import './../../config/config.dart';

class Dropdown extends StatelessWidget {
  final String selectedTitle;
  final int selected;
  final Function updateSelected;
  final bool padding;
  final dynamic data;

  Dropdown({this.selectedTitle, this.selected, this.updateSelected, this.padding = false, this.data});

  Widget _buildDropdown() {
    List<DropdownMenuItem<int>> items = [];

    void _changedDropDownItem(int selected) {
      updateSelected(selected);
    }

    // Initial select.
    items.add(
      new DropdownMenuItem(
        value: 0,
        child: Text(
          selectedTitle,
          style: TextStyle(
            fontSize: 9.0,
          ),
        ),
      ),
    );

    // Additional select items.
    for (dynamic d in data) {
      items.add(
        new DropdownMenuItem(
          value: int.parse(d.info.id),
          child: Text(
            d.info.name,
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      );
    }

    return Container(
      padding: (this.padding) ? EdgeInsets.only(left: 10.0) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
        color: Palette.greyColour,
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        value: selected,
        items: items,
        onChanged: _changedDropDownItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildDropdown(),
          ],
        ),
      ),
    );
  }
}
