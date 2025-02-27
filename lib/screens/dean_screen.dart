import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mitaoe/constants/global_variables.dart';
import 'package:mitaoe/screens/requisition_details_pdf.dart';

class DeanScreen extends StatefulWidget {
  const DeanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DeanScreen> createState() => _DeanScreenState();
}

class _DeanScreenState extends State<DeanScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: GlobalVariables.backgroundColor,
          elevation: 0.0,
          title: const Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.card_travel),
                SizedBox(width: 20),
                Text(
                  'Requisition',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.history)
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: GlobalVariables.blueTextColor,
            labelColor: GlobalVariables.blueTextColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Received'),
              Tab(text: 'Past'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Received Tab
          ListView(
            children: [
              RequisitionCard(
                title: 'Arrangements of Breakfast for External Visitors',
                date: '18/01/2025',
                requester: 'Pranav Shriram',
                designation: 'designation',
                location: 'School Of Computer Engineering',
                onAccept: () {
                  // Handle accept
                },
                onReject: () {
                  // Handle reject
                },
                onViewDetails: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CanteenRequisitionPDF(),
                  //   ),
                  // );
                  
                  CanteenRequisitionPDF.generateAndPrintPDF();
                },
              ),
            ],
          ),
          // Past Tab
          ListView(
            children: [
              RequisitionCard(
                title: 'Arrangements of Breakfast for External Visitors',
                date: '15/01/2025',
                requester: 'Pranav Shriram',
                designation: 'Professor',
                location: 'School Of Computer Engineering',
                showActions: false,  // Hide accept/reject buttons for past requisitions
                status: 'Completed',  // Show status for past requisitions
                onViewDetails: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CanteenRequisitionPDF(),
                  //   ),
                  // );
                  CanteenRequisitionPDF.generateAndPrintPDF();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RequisitionCard extends StatelessWidget {
  final String title;
  final String date;
  final String requester;
  final String designation;
  final String location;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  final VoidCallback onViewDetails;
  final bool showActions;
  final String? status;

  const RequisitionCard({
    Key? key,
    required this.title,
    required this.date,
    required this.requester,
    required this.designation,
    required this.location,
    this.onAccept,
    this.onReject,
    required this.onViewDetails,
    this.showActions = true,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: GlobalVariables.blueBackground,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.library_books_outlined,
                      size: 25,
                      color: GlobalVariables.blueTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'SemiBold',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  date,
                  style: const TextStyle(
                    color: GlobalVariables.greyTextColor,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  requester,
                  style: const TextStyle(
                    color: GlobalVariables.greyTextColor,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '~ $designation',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(
                      color: GlobalVariables.greyTextColor,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                if (showActions) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: GlobalVariables.blueBackground,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: GlobalVariables.blueTextColor),
                    ),
                    child: InkWell(
                      onTap: onAccept,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: GlobalVariables.blueTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.red),
                    ),
                    child: InkWell(
                      onTap: onReject,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Reject',
                            style: TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else if (status != null) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        status!,
                        style: const TextStyle(
                          fontFamily: 'Regular',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                GestureDetector(
                  onTap: onViewDetails,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: GlobalVariables.greenColor,
                          fontFamily: 'Regular',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.forward,
                        color: GlobalVariables.greenColor,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
