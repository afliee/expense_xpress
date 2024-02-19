import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BudgetLoading {
  static Widget build(BuildContext context) {
    // return loading with shimmer effect
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.background,
        highlightColor: Theme.of(context).colorScheme.onBackground,
        period: const Duration(milliseconds: 1000),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // text center
              Container(
                width: double.infinity,
                height: 16,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              const SizedBox(height: 8),
              Divider(
                height: 2,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: double.infinity,
                                      height: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
