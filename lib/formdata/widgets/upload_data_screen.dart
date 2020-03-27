import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openspaces/covid19/colors.dart';
import 'package:openspaces/covid19/common_widgets.dart';
import 'package:openspaces/formdata/form_repository.dart';
import 'package:openspaces/hospitalmap/widgets/covid_app_bar.dart';

class UploadDataScreen extends StatefulWidget {
  @override
  _UploadDataScreenState createState() => _UploadDataScreenState();
}

class _UploadDataScreenState extends State<UploadDataScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  var questionLabelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: OpenSpaceColors.text_color);

  String errorLabel = "कृपया यसलाई खाली नछोड्नुहोस्";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: covidAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                initialValue: {},
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: "name",
                      decoration: InputDecoration(
                          fillColor: OpenSpaceColors.red,
                          labelStyle: questionLabelStyle,
                          labelText: "नामः",
                          hintText: ""),
                      validators: [FormBuilderValidators.required()],
                    ),
                    FormBuilderTextField(
                      attribute: "age",
                      decoration: InputDecoration(
                          fillColor: OpenSpaceColors.red,
                          labelStyle: questionLabelStyle,
                          labelText: "उमेरः",
                          hintText: ""),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(100),
                        FormBuilderValidators.required()
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          labelText: "प्रयोगकर्ताको लिङ्ग: "),
                      attribute: "gender",
                      options: [
                        FormBuilderFieldOption(
                          label: "पुरुष",
                          value: "Male",
                        ),
                        FormBuilderFieldOption(
                          label: "महिला",
                          value: "Female",
                        ),
                        FormBuilderFieldOption(
                          label: "अन्य",
                          value: "Other",
                        )
                      ],
                    ),
                    FormBuilderTextField(
                      attribute: "temperature:",
                      decoration: InputDecoration(
                          fillColor: OpenSpaceColors.red,
                          labelStyle: questionLabelStyle,
                          labelText: "तापक्रम:",
                          hintText: ""),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(200),
                        FormBuilderValidators.required()
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText:
                              "के तपाईँ सेल्फ क्वारेन्टाइनमा बस्नुभएको छ?"),
                      attribute: "in_self_quarrantine",
                      validators: [FormBuilderValidators.required()],
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "सुख्खा तथा लहरे खोकीः "),
                      attribute: "have_cough",
                      validators: [FormBuilderValidators.required()],
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "थकाई लाग्नेः "),
                      attribute: "have_fatigue",
                      validators: [FormBuilderValidators.required()],
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "घाँटी बस्नेः "),
                      attribute: "have_throat_pain",
                      validators: [FormBuilderValidators.required()],
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText:
                              "आराम गर्दा पनि सास छोटो भएजस्तो लाग्नेः "),
                      attribute: "fast_breathe",
                      validators: [FormBuilderValidators.required()],
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "जीउ दुखाईः "),
                      attribute: "body_pain",
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "पखालाः "),
                      attribute: "diarrahoe",
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          hintText: "",
                          labelText: "सिँगान बग्नेः "),
                      attribute: "runny_nose",
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderSegmentedControl(
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(
                          labelStyle: questionLabelStyle,
                          alignLabelWithHint: false,
                          labelText: "वाकवाकीः "),
                      attribute: "vomit",
                      options: [
                        FormBuilderFieldOption(
                          label: "छ",
                          value: true,
                        ),
                        FormBuilderFieldOption(
                          value: false,
                          label: "छैन",
                        ),
                      ],
                    ),
                    FormBuilderTextField(
                      attribute: "contact_no",
                      decoration: InputDecoration(
                          fillColor: OpenSpaceColors.red,
                          labelStyle: questionLabelStyle,
                          labelText: "सम्पर्क नम्बर:",
                          hintText: ""),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric()
                      ],
                    ),
                    FormBuilderTextField(
                      attribute: "address",
                      decoration: InputDecoration(
                        fillColor: OpenSpaceColors.red,
                        labelStyle: questionLabelStyle,
                        labelText: "ठेगाना:",
                        helperText: "उत्तर अनिवार्य छैन",
                      ),
                      validators: [],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(16),
                color: OpenSpaceColors.button_red,
                child: Center(
                  child: isUploadingForm
                      ? Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () {
                            if (_fbKey.currentState.saveAndValidate()) {
                              setState(() {
                                isUploadingForm = true;
                              });

                              formRepository
                                  .uploadSymtomForm(_fbKey.currentState.value)
                                  .then((statusCode) {
                                showToastMessage(
                                    message: statusCode.toString());
                                setState(() {
                                  isUploadingForm = false;
                                });
                              }).catchError((error, stack) {
                                print(stack);
                                showToastMessage(
                                    message: "फारम बुझाउन असफल भयो");
                                setState(() {
                                  isUploadingForm = false;
                                });
                              });
                            } else {
                              showToastMessage(message: "फारममा त्रुटिहरू छन्");
                            }
                          },
                          child: Text(
                            "फारम बुझाउनुहोस्",
                            style: TextStyle(
                                color: OpenSpaceColors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isUploadingForm = false;
}
