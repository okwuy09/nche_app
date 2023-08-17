import 'package:flutter/material.dart';

import '../../widget/button.dart';
import '../../widget/colors.dart';
import '../../widget/popover.dart';
import '../../widget/style.dart';

class TeamsAndCondition extends StatefulWidget {
  const TeamsAndCondition({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  State<TeamsAndCondition> createState() => _TeamsAndConditionState();
}

class _TeamsAndConditionState extends State<TeamsAndCondition> {
  final ScrollController _controller = ScrollController();

  bool scrowDown = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          setState(() {
            scrowDown = false;
          });
        } else {
          setState(() {
            scrowDown = true;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        children: [
          Text(
            'Terms and Conditions',
            style: style.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height / 2,
            child: RawScrollbar(
              controller: _controller,
              child: SingleChildScrollView(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc leo eu ultrices praesent lorem blandit sociis. Vel sapien dolor magna cras velit porttitor tincidunt etiam. Egestas dictum consectetur in pellentesque molestie sagittis volutpat felis semper. Velit egestas augue vitae convallis eget. Neque gravida turpis nisi, donec orci mattis porttitor. Pharetra, amet volutpat morbi feugiat tincidunt vitae integer. Egestas mi sit duis fermentum facilisis risus, pharetra. Nunc massa nulla eget maecenas. Turpis diam ac ut bibendum iaculis. Mauris, et ac mauris volutpat aliquam duis eu egestas proin. Vulputate urna, sagittis arcu bibendum erat venenatis eleifend. Egestas purus dui sed amet, sem sapien. Odio odio dolor egestas diam aliquam risus, fringilla ultricies. Vel consequat neque, turpis penatibus sed a. Semper sed curabitur donec eu lacus phasellus amet. Orci proin nibh ante vestibulum volutpat accumsan. Semper eleifend ipsum dolor adipiscing sit neque aenean. Volutpat et id odio cras egestas pretium tincidunt risus. Sed pellentesque nunc, id urna. Sed velit suspendisse nunc, aliquet. Augue ut orci amet sed. Sed risus sed amet bibendum. Velit a viverra volutpat ultricies risus lectus a, aliquet purus. Morbi tempor pellentesque volutpat dignissim hendrerit condimentum. Massa, at turpis praesent erat sed sagittis, mi eros, pellentesque. Ultricies volutpat sit semper massa elit vivamus erat est. Vitae pellentesque eu tristique feugiat sit aliquet sapien malesuada. Ullamcorper ultrices posuere euismod dictum nulla at. Nulla a viverra et, diam sit diam id egestas euismod. Pellentesque sed tortor, tincidunt vulputate molestie. A vestibulum neque condimentum ut luctus fringilla purus. Iaculis scelerisque volutpat ullamcorper leo enim viverra sed consequat. Sed massa condimentum tortor suspendisse diam sit. Fermentum ultrices sagittis, venenatis fermentum, ullamcorper libero sed. Sit tortor eget pellentesque sed orci neque et enim, donec. Facilisis porta nulla gravida donec sed condimentum. Dolor egestas et urna, egestas arcu at amet sagittis. Cras et dictumst nulla duis duis. Maecenas et tincidunt sed rhoncus consectetur sed. At tempus urna metus vestibulum. Viverra lacus etiam convallis quis vel. Nunc consectetur arcu faucibus id mattis est facilisis. Sed quam nullam fringilla egestas ornare aliquet amet, pellentesque. Morbi in nunc felis egestas facilisi. Morbi mi purus orci eu ac scelerisque at nisi. Et sit semper eget tincidunt. Et, sed sit sed sed sed vestibulum. Cursus vestibulum at quam enim vestibulum faucibus. Gravida scelerisque feugiat ornare vitae amet, fermentum. Mi sed viverra pretium ipsum nunc fermentum, dui lorem fringilla. Elementum, libero ultricies faucibus donec. Enim porttitor commodo ac eget nisi. Platea gravida in imperdiet nibh in. Quis tincidunt consequat ultricies in neque diam nulla lacinia. Lacinia ullamcorper massa lacus, nibh enim, massa lorem enim gravida. Dolor in sed magna molestie eu. Nunc convallis nunc neque, faucibus. Faucibus lectus eu ultrices bibendum habitasse et. Nullam ipsum, venenatis felis, elit lacus aliquam cras lorem magna. Sed sollicitudin vitae in aliquam auctor quis viverra tempor fames. Amet faucibus habitasse feugiat magna integer. Nec mi, lectus vitae rhoncus donec mauris. Gravida leo morbi cras vivamus sagittis ut eget. Congue aliquet mauris, mattis sagittis senectus nunc. Lectus non molestie luctus egestas rutrum odio. Aliquam vitae, ultricies amet sagittis, luctus orci. Faucibus cursus nisl tellus augue. Euismod volutpat mollis ac sed urna, aliquam. Cras nibh proin aliquam, faucibus neque nulla mattis volutpat. Orci at at sit sollicitudin leo aliquam tellus nisi. Ut sed accumsan integer elit, enim ullamcorper pellentesque. Etiam magna ut fermentum tristique in faucibus amet. Libero at diam rhoncus duis. Sit etiam in donec varius. Convallis id tellus varius sollicitudin consectetur purus, morbi in. Non integer pellentesque parturient a. Viverra in eget gravida maecenas nulla ut. Suspendisse sodales vitae egestas interdum vivamus non duis enim placerat. Leo velit, nunc, eu egestas accumsan dignissim curabitur. Sed et viverra tellus at purus viverra posuere tempor viverra. Lectus at tellus, cursus amet, morbi et quis. In tincidunt et leo euismod nunc. Quam turpis sagittis, nibh bibendum rutrum neque, interdum massa sed. Cursus aliquet ac nunc cras in cursus. Tortor etiam et ullamcorper in aliquet. Felis, et leo, tristique condimentum adipiscing pretium suspendisse justo. Sapien tortor faucibus leo, at tellus dui nec arcu. Sit egestas scelerisque lectus id nibh in urna mollis. Cras gravida nisi, vivamus at egestas. Tellus pulvinar lacus urna, viverra ut sit. Egestas aliquet lobortis leo orci sed amet, suspendisse ullamcorper. Tincidunt congue nunc, volutpat sed pretium amet, pharetra, aliquet bibendum. In nec mi risus eu urna, volutpat. Tincidunt lorem sed facilisis neque. Morbi nulla tortor tristique proin scelerisque sagittis.',
                  style: style.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MainButton(
              borderColor: Colors.transparent,
              backgroundColor: scrowDown
                  ? AppColor.primaryColor
                  : AppColor.primaryColorLight,
              onTap: scrowDown ? widget.onTap : null,
              child: Text(
                'Agree and Continue',
                style: TextStyle(
                  fontSize: 14,
                  color: scrowDown
                      ? AppColor.white
                      : AppColor.lightGrey.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
