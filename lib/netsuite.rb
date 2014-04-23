require 'set'

require 'savon'
require 'netsuite/version'
require 'netsuite/errors'
require 'netsuite/utilities'
require 'netsuite/core_ext/string/lower_camelcase'

module NetSuite
  autoload :Configuration, 'netsuite/configuration'
  autoload :Response,      'netsuite/response'

  module Namespaces
    autoload :ActSched,       'netsuite/namespaces/act_sched'
    autoload :ListAcct,       'netsuite/namespaces/list_acct'
    autoload :ListRel,        'netsuite/namespaces/list_rel'
    autoload :ListSupport,    'netsuite/namespaces/list_support'
    autoload :PlatformCommon, 'netsuite/namespaces/platform_common'
    autoload :PlatformCore,   'netsuite/namespaces/platform_core'
    autoload :TranBank,       'netsuite/namespaces/tran_bank'
    autoload :TranCust,       'netsuite/namespaces/tran_cust'
    autoload :TranGeneral,    'netsuite/namespaces/tran_general'
    autoload :TranSales,      'netsuite/namespaces/tran_sales'
    autoload :SetupCustom,    'netsuite/namespaces/setup_custom'
  end

  module Support
    autoload :Actions,    'netsuite/support/actions'
    autoload :Attributes, 'netsuite/support/attributes'
    autoload :Fields,     'netsuite/support/fields'
    autoload :RecordRefs, 'netsuite/support/record_refs'
    autoload :Records,    'netsuite/support/records'
    autoload :Requests,   'netsuite/support/requests'
    autoload :SearchResult, 'netsuite/support/search_result'
  end

  module Actions
    autoload :Add,              'netsuite/actions/add'
    autoload :Delete,           'netsuite/actions/delete'
    autoload :Get,              'netsuite/actions/get'
    autoload :GetList,          'netsuite/actions/get_list'
    autoload :GetSelectValue,   'netsuite/actions/get_select_value'
    autoload :Initialize,       'netsuite/actions/initialize'
    autoload :Update,           'netsuite/actions/update'
    autoload :Upsert,           'netsuite/actions/upsert'
    autoload :Search,           'netsuite/actions/search'
    autoload :SearchMoreWithId, 'netsuite/actions/search_more_with_id'
  end

  module Records
    autoload :AssemblyItem,               'netsuite/records/assembly_item'
    autoload :Account,                    'netsuite/records/account'
    autoload :AccountingPeriod,           'netsuite/records/accounting_period'
    autoload :BaseRefList,                'netsuite/records/base_ref_list'
    autoload :BillAddress,                'netsuite/records/bill_address'
    autoload :BinNumberList,              'netsuite/records/bin_number_list'
    autoload :CashSale,                   'netsuite/records/cash_sale'
    autoload :Classification,             'netsuite/records/classification'
    autoload :CreditMemo,                 'netsuite/records/credit_memo'
    autoload :CreditMemoApply,            'netsuite/records/credit_memo_apply'
    autoload :CreditMemoApplyList,        'netsuite/records/credit_memo_apply_list'
    autoload :CreditMemoItem,             'netsuite/records/credit_memo_item'
    autoload :CreditMemoItemList,         'netsuite/records/credit_memo_item_list'
    autoload :CustomField,                'netsuite/records/custom_field'
    autoload :CustomFieldList,            'netsuite/records/custom_field_list'
    autoload :CustomRecord,               'netsuite/records/custom_record'
    autoload :CustomRecordRef,            'netsuite/records/custom_record_ref'
    autoload :CustomRecordType,           'netsuite/records/custom_record_type'
    autoload :Customer,                   'netsuite/records/customer'
    autoload :CustomerAddressbook,        'netsuite/records/customer_addressbook'
    autoload :CustomerAddressbookList,    'netsuite/records/customer_addressbook_list'
    autoload :CustomerDeposit,            'netsuite/records/customer_deposit'
    autoload :CustomerPayment,            'netsuite/records/customer_payment'
    autoload :CustomerPaymentApply,       'netsuite/records/customer_payment_apply'
    autoload :CustomerPaymentApplyList,   'netsuite/records/customer_payment_apply_list'
    autoload :CustomerRefund,             'netsuite/records/customer_refund'
    autoload :CustomerRefundApply,        'netsuite/records/customer_refund_apply'
    autoload :CustomerRefundApplyList,    'netsuite/records/customer_refund_apply_list'
    autoload :CustomerRefundDeposit,      'netsuite/records/customer_refund_deposit'
    autoload :CustomerRefundDepositList,  'netsuite/records/customer_refund_deposit_list'
    autoload :ContactList,                'netsuite/records/contact_list'
    autoload :Contact,                    'netsuite/records/contact'
    autoload :Department,                 'netsuite/records/department'
    autoload :Deposit,                    'netsuite/records/deposit'
    autoload :DepositPayment,             'netsuite/records/deposit_payment'
    autoload :DepositPaymentList,         'netsuite/records/deposit_payment_list'
    autoload :Duration,                   'netsuite/records/duration'
    autoload :InventoryItem,              'netsuite/records/inventory_item'
    autoload :Invoice,                    'netsuite/records/invoice'
    autoload :InvoiceItem,                'netsuite/records/invoice_item'
    autoload :InvoiceItemList,            'netsuite/records/invoice_item_list'
    autoload :ItemFulfillment,            'netsuite/records/item_fulfillment'
    autoload :ItemFulfillmentItem,        'netsuite/records/item_fulfillment_item'
    autoload :ItemFulfillmentItemList,    'netsuite/records/item_fulfillment_item_list'
    autoload :ItemFulfillmentPackage,     'netsuite/records/item_fulfillment_package'
    autoload :ItemFulfillmentPackageList, 'netsuite/records/item_fulfillment_package_list'
    autoload :Job,                        'netsuite/records/job'
    autoload :JournalEntry,               'netsuite/records/journal_entry'
    autoload :JournalEntryLine,           'netsuite/records/journal_entry_line'
    autoload :JournalEntryLineList,       'netsuite/records/journal_entry_line_list'
    autoload :KitItem,                    'netsuite/records/kit_item'
    autoload :Location,                   'netsuite/records/location'
    autoload :LocationsList,              'netsuite/records/locations_list'
    autoload :MatrixOptionList,           'netsuite/records/matrix_option_list'
    autoload :NonInventorySaleItem,       'netsuite/records/non_inventory_sale_item'
    autoload :PaymentMethod,              'netsuite/records/payment_method'
    autoload :PhoneCall,                  'netsuite/records/phone_call'
    autoload :PricingMatrix,              'netsuite/records/pricing_matrix'
    autoload :RecordRef,                  'netsuite/records/record_ref'
    autoload :RevRecTemplate,             'netsuite/records/rev_rec_template'
    autoload :SalesOrder,                 'netsuite/records/sales_order'
    autoload :SalesOrderItem,             'netsuite/records/sales_order_item'
    autoload :SalesOrderItemList,         'netsuite/records/sales_order_item_list'
    autoload :ServiceSaleItem,            'netsuite/records/service_sale_item'
    autoload :ShipAddress,                'netsuite/records/ship_address'
    autoload :SupportCase,                'netsuite/records/support_case'
    autoload :Task,                       'netsuite/records/task'
    autoload :Term,                       'netsuite/records/term'
    autoload :Transaction,                'netsuite/records/transaction'
  end

  def self.configure(&block)
    NetSuite::Configuration.instance_eval(&block)
  end

end
