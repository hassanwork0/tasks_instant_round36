import 'package:job_ui/features/job/data/model/job_model.dart';
import 'package:job_ui/features/job/presentation/widgets/space_line.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class jobCard extends StatelessWidget {
  const jobCard({super.key, required this.jobModel});

  final JobModel jobModel;

  String _formatCreatedAt() {
    final date = DateTime.fromMillisecondsSinceEpoch(jobModel.createdAt * 1000);
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        jobModel.companyName.split(' ').take(3).join(' '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 47, 33, 182),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(_formatCreatedAt(), maxLines: 1, softWrap: false),
                  ],
                ),
              ),

              Text(
                "${jobModel.title.split(' ').take(3).join(' ')}",
                style: TextStyle(fontSize: 20),
              ),

              Row(
                children: [
                  Icon(Icons.location_pin),
                  Text(
                    jobModel.location.isEmpty
                        ? "No location"
                        : jobModel.location.split(' ').take(3).join(' '),
                  ),
                ],
              ),

              spaceLine(),
              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE8E5FF),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        jobModel.jobTypes.isEmpty
                            ? "No job type"
                            : jobModel.jobTypes
                                  .join(' ')
                                  .split(' ')
                                  .take(3)
                                  .join(' '),
                        style: TextStyle(
                          color: Color.fromARGB(255, 47, 33, 182),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse(jobModel.url);
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Color.fromARGB(255, 47, 33, 182),
                            width: 1.5,
                          ),
                        ),

                        child: Text(
                          "Apply",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 33, 182),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
