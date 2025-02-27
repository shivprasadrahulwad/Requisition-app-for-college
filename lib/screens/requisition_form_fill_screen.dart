import 'package:flutter/material.dart';
import 'package:mitaoe/screens/requisition_details_pdf.dart';


class RequisitionFormFillScreen extends StatefulWidget {
  @override
  _RequisitionFormFillScreenState createState() => _RequisitionFormFillScreenState();
}

class _RequisitionFormFillScreenState extends State<RequisitionFormFillScreen> {
  final List<Map<String, dynamic>> _addedItems = [];
  final List<String> _options = ['Tea', 'Coffee', 'Breakfast', 'Lunch', 'Add Other'];
  String? _selectedOption;
  int _quantity = 1;

  final TextEditingController _customItemController = TextEditingController();
  final TextEditingController _dropdownController = TextEditingController();

  // Enhanced color scheme
static const Color primaryColor = Color(0xFF2AB7CA);
static const Color primaryLight = Color(0xFF8DE1E9);
static const Color accentColor = Color(0xFF38BDF8);
static const Color secondaryColor = Color(0xFFE0F7FA);
static const Color textColor = Color(0xFF003B3D);
static const Color borderColor = Color(0xFFB2EBF2);
static const Color dangerColor = Color(0xFFE57373);
static const Color successColor = Color(0xFF81C784);


  void _addItem() {
    if ((_selectedOption == 'Add Other' && _customItemController.text.isNotEmpty) ||
        (_selectedOption != null && _selectedOption != 'Add Other')) {
      setState(() {
        _addedItems.add({
          'item': _selectedOption == 'Add Other' ? _customItemController.text : _selectedOption,
          'quantity': _quantity,
        });
        _selectedOption = null;
        _dropdownController.clear();
        _customItemController.clear();
        _quantity = 1;
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _addedItems.removeAt(index);
    });
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primaryColor, primaryLight],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_quantity > 1) setState(() => _quantity--);
                    },
                    icon: Icon(Icons.remove, color: Colors.white, size: 20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$_quantity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => _quantity++),
                    icon: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedOption,
          hint: Text(
            'Select an item',
            style: TextStyle(
              color: textColor.withOpacity(0.5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          isExpanded: true,
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
          items: _options.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue;
              _dropdownController.text = newValue ?? '';
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: Container(
        color: Color(0xFF2AB7CA), // Background color for the app bar
        child: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          title: const Text(
            'Requisition form',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent, // Make the background transparent
          elevation: 0,
        ),
      ),
    ),
  ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [secondaryColor, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _selectedOption == 'Add Other'
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, secondaryColor],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.08),
                              blurRadius: 15,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _customItemController,
                          decoration: InputDecoration(
                            hintText: 'Enter custom item',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: textColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    : _buildDropdown(),
                SizedBox(height: 16),
                _buildQuantitySelector(),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, primaryLight],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _addItem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2AB7CA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Add Item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    '✨✨   Added Items   ✨✨',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: _addedItems.length,
                    itemBuilder: (context, index) {
                      final item = _addedItems[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, secondaryColor],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.08),
                              blurRadius: 15,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                            '🔶🔹${item['item']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          Text(
                            '🔹${item['quantity']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () => _removeItem(index),
                            icon: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: dangerColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(Icons.delete_outline, color: dangerColor),
                            ),
                          ),
                        ),
                      );
                    }
                      )
                    ),
              ]
                  ),
                ),
            ),
          ),
          bottomNavigationBar: Container(
  height: 60,
  width: double.infinity,
  decoration: BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  ),
  child: GestureDetector(
    onTap: () {
      CanteenRequisitionPDF.generateAndPrintPDF();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          'Generate PDF',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),

    );
  
  }
}