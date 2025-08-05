import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/widgts/back_to_home.dart';
import 'package:qubitarts/generated/l10n.dart';

import 'package:qubitarts/feature/one_service/logic/one_service_cubit.dart';
import 'package:qubitarts/feature/one_service/ui/widgets/pdf_container.dart';
import 'package:qubitarts/feature/one_service/ui/widgets/service_name_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../payment/data/model/payment_model.dart';
import '../../../payment/data/repo/payment_repo.dart';
import '../../../payment/logic/payment_cubit.dart';
import '../../../payment/logic/payment_state.dart';


class OneServiceScreen extends StatefulWidget {
  const OneServiceScreen({
    Key? key,
    required this.title,
    required this.startDate,
    required this.status,
    required this.requestId,
    required this.amountCents,
    required this.billingData,
  }) : super(key: key);

  final String title;
  final String startDate;
  final String status;
  final String requestId;
  final int amountCents;
  final Map<String, dynamic> billingData;

  @override
  State<OneServiceScreen> createState() => _OneServiceScreenState();
}

class _OneServiceScreenState extends State<OneServiceScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    OneServiceCubit.get(context).getRequest(widget.requestId);
  }

  @override
  Widget build(BuildContext context) {
    final priceEGP = (widget.amountCents / 100).toStringAsFixed(2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackToHomeButton(),
                    SizedBox(width: 20.w),
                    Image.asset(
                      'assets/images/agency.png',
                      height: 40.h,
                      width: 171.5.w,
                    ),
                  ],
                ),

                verticalSpace(20),

                ServiceNameAndState(
                  title: widget.title,
                  startDate: widget.startDate,
                  status: widget.status,
                ),

                verticalSpace(10),

                Row(
                  children: [
                    const Text(
                      'Price:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalSpace(10),
                    TextButton(
                      onPressed: () {
                        final cubit = KashierCubit(
                          KashierRepository(
                            publicKey: 'd4a56ce345c8380589ee83a5d8397f06\$ba5dbdcffd328f91aa9563e84d80ca7049e18be14bfa8c6015642eebefec713504caf718bdfc58d3e4c077b9f0682f58',
                            merchantId: '571362c4-24aa-4060-b980-46fc5622dc9b',
                          ),
                        );

                        final paymentRequest = KashierPaymentRequest(
                          amountCents: widget.amountCents,
                          currency: 'EGP',
                          merchantId: '571362c4-24aa-4060-b980-46fc5622dc9b',
                          orderId: widget.requestId,
                          billingData: widget.billingData,
                        );

                        cubit.createCheckout(paymentRequest);

                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: cubit,
                            child: BlocBuilder<KashierCubit, KashierState>(
                              builder: (context, state) {
                                if (state is KashierLoading) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (state is KashierSuccess) {
                                  Navigator.of(context).pop(); // Close the loading
                                  // Open browser or webview here
                                  // Use `url_launcher`:
                                  launchUrl(Uri.parse(state.checkoutUrl), mode: LaunchMode.externalApplication);
                                  return const SizedBox.shrink();
                                } else if (state is KashierError) {
                                  return AlertDialog(
                                    title: const Text('Payment Error'),
                                    content: Text(state.message),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF3276E8),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Checkout $priceEGP EGP'),
                    ),

                    verticalSpace(20),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffE2ECF5),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [
                      verticalSpace(20),

                      BlocBuilder<OneServiceCubit, OneServiceState>(
                        builder: (context, state) {
                          if (state is GetRequestSuccess) {
                            final req =
                                OneServiceCubit.get(context).request;
                            return Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                if (req['quotationPDF'] != null)
                                  PdfsContainer(
                                    pdfImage: 'assets/images/ques.png',
                                    pdfName: S.of(context).Quotation,
                                    pdfString: req['quotationPDF'],
                                  ),
                                if (req['contractPDF'] != null)
                                  PdfsContainer(
                                    pdfImage: 'assets/images/contract.png',
                                    pdfName: S.of(context).Contract,
                                    pdfString: req['contractPDF'],
                                  ),
                                if (req['PaymentPDF'] != null)
                                  PdfsContainer(
                                    pdfImage: 'assets/images/payment.png',
                                    pdfName: S.of(context).Payment,
                                    pdfString: req['PaymentPDF'],
                                  ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffFEDC32),
                            ),
                          );
                        },
                      ),

                      verticalSpace(15),

                      BlocBuilder<OneServiceCubit, OneServiceState>(
                        builder: (context, state) {
                          if (state is GetRequestSuccess) {
                            return OneServiceCubit.get(context)
                                .checkRequestType(widget.title);
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffFEDC32),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      ),
    ),
    );
  }
}
