defmodule Libxml.Error do
  defstruct(
    # What part of the library raised this error
    domain: :unknown,
    # The error code, e.g. an xmlParserError
    code: :unknown,
    # human-readable informative error message
    message: "",
    # how consequent is the error
    level: :unknown,
    # the filename
    file: "",
    # the line number if available
    line: 0,
    # extra string information
    str1: "",
    # extra string information
    str2: "",
    # extra string information
    str3: "",
    # extra number information
    int1: 0,
    # error column # or 0 if N/A (todo: rename field when we would brk ABI)
    int2: 0
  )

  def from_map(data) do
    %Libxml.Error{
      domain: to_domain(data[:domain]),
      code: to_code(data[:code]),
      message: data[:message] || "",
      level: to_level(data[:level]),
      file: data[:file] || "",
      line: data[:line] || 0,
      str1: data[:str1] || "",
      str2: data[:str2] || "",
      str3: data[:str3] || "",
      int1: data[:int1] || 0,
      int2: data[:int2] || 0
    }
  end

  defp to_domain(domain) do
    case domain do
      0 ->
        :from_none

      # The XML parser
      1 ->
        :from_parser

      # The tree module
      2 ->
        :from_tree

      # The XML Namespace module
      3 ->
        :from_namespace

      # The XML DTD validation with parser context
      4 ->
        :from_dtd

      # The HTML parser
      5 ->
        :from_html

      # The memory allocator
      6 ->
        :from_memory

      # The serialization code
      7 ->
        :from_output

      # The Input/Output stack
      8 ->
        :from_io

      # The FTP module
      9 ->
        :from_ftp

      # The HTTP module
      10 ->
        :from_http

      # The XInclude processing
      11 ->
        :from_xinclude

      # The XPath module
      12 ->
        :from_xpath

      # The XPointer module
      13 ->
        :from_xpointer

      # The regular expressions module
      14 ->
        :from_regexp

      # The W3C XML Schemas Datatype module
      15 ->
        :from_datatype

      # The W3C XML Schemas parser module
      16 ->
        :from_schemasp

      # The W3C XML Schemas validation module
      17 ->
        :from_schemasv

      # The Relax-NG parser module
      18 ->
        :from_relaxngp

      # The Relax-NG validator module
      19 ->
        :from_relaxngv

      # The Catalog module
      20 ->
        :from_catalog

      # The Canonicalization module
      21 ->
        :from_c14n

      # The XSLT engine from libxslt
      22 ->
        :from_xslt

      # The XML DTD validation with valid context
      23 ->
        :from_valid

      # The error checking module
      24 ->
        :from_check

      # The xmlwriter module
      25 ->
        :from_writer

      # The dynamically loaded module modul
      26 ->
        :from_module

      # The module handling character conversion
      27 ->
        :from_i18n

      # The Schematron validator module
      28 ->
        :from_schematronv

      # The buffers module
      29 ->
        :from_buffer

      # The URI module
      30 ->
        :from_uri

      _ ->
        :unknown
    end
  end

  defp to_code(code) do
    case code do
      0 -> :err_ok
      1 -> :err_internal_error
      2 -> :err_no_memory
      3 -> :err_document_start
      4 -> :err_document_empty
      5 -> :err_document_end
      6 -> :err_invalid_hex_charref
      7 -> :err_invalid_dec_charref
      8 -> :err_invalid_charref
      9 -> :err_invalid_char
      10 -> :err_charref_at_eof
      11 -> :err_charref_in_prolog
      12 -> :err_charref_in_epilog
      13 -> :err_charref_in_dtd
      14 -> :err_entityref_at_eof
      15 -> :err_entityref_in_prolog
      16 -> :err_entityref_in_epilog
      17 -> :err_entityref_in_dtd
      18 -> :err_peref_at_eof
      19 -> :err_peref_in_prolog
      20 -> :err_peref_in_epilog
      21 -> :err_peref_in_int_subset
      22 -> :err_entityref_no_name
      23 -> :err_entityref_semicol_missing
      24 -> :err_peref_no_name
      25 -> :err_peref_semicol_missing
      26 -> :err_undeclared_entity
      27 -> :war_undeclared_entity
      28 -> :err_unparsed_entity
      29 -> :err_entity_is_external
      30 -> :err_entity_is_parameter
      31 -> :err_unknown_encoding
      32 -> :err_unsupported_encoding
      33 -> :err_string_not_started
      34 -> :err_string_not_closed
      35 -> :err_ns_decl_error
      36 -> :err_entity_not_started
      37 -> :err_entity_not_finished
      38 -> :err_lt_in_attribute
      39 -> :err_attribute_not_started
      40 -> :err_attribute_not_finished
      41 -> :err_attribute_without_value
      42 -> :err_attribute_redefined
      43 -> :err_literal_not_started
      44 -> :err_literal_not_finished
      45 -> :err_comment_not_finished
      46 -> :err_pi_not_started
      47 -> :err_pi_not_finished
      48 -> :err_notation_not_started
      49 -> :err_notation_not_finished
      50 -> :err_attlist_not_started
      51 -> :err_attlist_not_finished
      52 -> :err_mixed_not_started
      53 -> :err_mixed_not_finished
      54 -> :err_elemcontent_not_started
      55 -> :err_elemcontent_not_finished
      56 -> :err_xmldecl_not_started
      57 -> :err_xmldecl_not_finished
      58 -> :err_condsec_not_started
      59 -> :err_condsec_not_finished
      60 -> :err_ext_subset_not_finished
      61 -> :err_doctype_not_finished
      62 -> :err_misplaced_cdata_end
      63 -> :err_cdata_not_finished
      64 -> :err_reserved_xml_name
      65 -> :err_space_required
      66 -> :err_separator_required
      67 -> :err_nmtoken_required
      68 -> :err_name_required
      69 -> :err_pcdata_required
      70 -> :err_uri_required
      71 -> :err_pubid_required
      72 -> :err_lt_required
      73 -> :err_gt_required
      74 -> :err_ltslash_required
      75 -> :err_equal_required
      76 -> :err_tag_name_mismatch
      77 -> :err_tag_not_finished
      78 -> :err_standalone_value
      79 -> :err_encoding_name
      80 -> :err_hyphen_in_comment
      81 -> :err_invalid_encoding
      82 -> :err_ext_entity_standalone
      83 -> :err_condsec_invalid
      84 -> :err_value_required
      85 -> :err_not_well_balanced
      86 -> :err_extra_content
      87 -> :err_entity_char_error
      88 -> :err_entity_pe_internal
      89 -> :err_entity_loop
      90 -> :err_entity_boundary
      91 -> :err_invalid_uri
      92 -> :err_uri_fragment
      93 -> :war_catalog_pi
      94 -> :err_no_dtd
      95 -> :err_condsec_invalid_keyword
      96 -> :err_version_missing
      97 -> :war_unknown_version
      98 -> :war_lang_value
      99 -> :war_ns_uri
      100 -> :war_ns_uri_relative
      101 -> :err_missing_encoding
      102 -> :war_space_value
      103 -> :err_not_standalone
      104 -> :err_entity_processing
      105 -> :err_notation_processing
      106 -> :war_ns_column
      107 -> :war_entity_redefined
      108 -> :err_unknown_version
      109 -> :err_version_mismatch
      110 -> :err_name_too_long
      111 -> :err_user_stop
      200 -> :ns_err_xml_namespace
      201 -> :ns_err_undefined_namespace
      202 -> :ns_err_qname
      203 -> :ns_err_attribute_redefined
      204 -> :ns_err_empty
      205 -> :ns_err_colon
      500 -> :dtd_attribute_default
      501 -> :dtd_attribute_redefined
      502 -> :dtd_attribute_value
      503 -> :dtd_content_error
      504 -> :dtd_content_model
      505 -> :dtd_content_not_determinist
      506 -> :dtd_different_prefix
      507 -> :dtd_elem_default_namespace
      508 -> :dtd_elem_namespace
      509 -> :dtd_elem_redefined
      510 -> :dtd_empty_notation
      511 -> :dtd_entity_type
      512 -> :dtd_id_fixed
      513 -> :dtd_id_redefined
      514 -> :dtd_id_subset
      515 -> :dtd_invalid_child
      516 -> :dtd_invalid_default
      517 -> :dtd_load_error
      518 -> :dtd_missing_attribute
      519 -> :dtd_mixed_corrupt
      520 -> :dtd_multiple_id
      521 -> :dtd_no_doc
      522 -> :dtd_no_dtd
      523 -> :dtd_no_elem_name
      524 -> :dtd_no_prefix
      525 -> :dtd_no_root
      526 -> :dtd_notation_redefined
      527 -> :dtd_notation_value
      528 -> :dtd_not_empty
      529 -> :dtd_not_pcdata
      530 -> :dtd_not_standalone
      531 -> :dtd_root_name
      532 -> :dtd_standalone_white_space
      533 -> :dtd_unknown_attribute
      534 -> :dtd_unknown_elem
      535 -> :dtd_unknown_entity
      536 -> :dtd_unknown_id
      537 -> :dtd_unknown_notation
      538 -> :dtd_standalone_defaulted
      539 -> :dtd_xmlid_value
      540 -> :dtd_xmlid_type
      541 -> :dtd_dup_token
      800 -> :html_strucure_error
      801 -> :html_unknown_tag
      1000 -> :rngp_anyname_attr_ancestor
      1001 -> :rngp_attr_conflict
      1002 -> :rngp_attribute_children
      1003 -> :rngp_attribute_content
      1004 -> :rngp_attribute_empty
      1005 -> :rngp_attribute_noop
      1006 -> :rngp_choice_content
      1007 -> :rngp_choice_empty
      1008 -> :rngp_create_failure
      1009 -> :rngp_data_content
      1010 -> :rngp_def_choice_and_interleave
      1011 -> :rngp_define_create_failed
      1012 -> :rngp_define_empty
      1013 -> :rngp_define_missing
      1014 -> :rngp_define_name_missing
      1015 -> :rngp_elem_content_empty
      1016 -> :rngp_elem_content_error
      1017 -> :rngp_element_empty
      1018 -> :rngp_element_content
      1019 -> :rngp_element_name
      1020 -> :rngp_element_no_content
      1021 -> :rngp_elem_text_conflict
      1022 -> :rngp_empty
      1023 -> :rngp_empty_construct
      1024 -> :rngp_empty_content
      1025 -> :rngp_empty_not_empty
      1026 -> :rngp_error_type_lib
      1027 -> :rngp_except_empty
      1028 -> :rngp_except_missing
      1029 -> :rngp_except_multiple
      1030 -> :rngp_except_no_content
      1031 -> :rngp_externalref_emtpy
      1032 -> :rngp_external_ref_failure
      1033 -> :rngp_externalref_recurse
      1034 -> :rngp_forbidden_attribute
      1035 -> :rngp_foreign_element
      1036 -> :rngp_grammar_content
      1037 -> :rngp_grammar_empty
      1038 -> :rngp_grammar_missing
      1039 -> :rngp_grammar_no_start
      1040 -> :rngp_group_attr_conflict
      1041 -> :rngp_href_error
      1042 -> :rngp_include_empty
      1043 -> :rngp_include_failure
      1044 -> :rngp_include_recurse
      1045 -> :rngp_interleave_add
      1046 -> :rngp_interleave_create_failed
      1047 -> :rngp_interleave_empty
      1048 -> :rngp_interleave_no_content
      1049 -> :rngp_invalid_define_name
      1050 -> :rngp_invalid_uri
      1051 -> :rngp_invalid_value
      1052 -> :rngp_missing_href
      1053 -> :rngp_name_missing
      1054 -> :rngp_need_combine
      1055 -> :rngp_notallowed_not_empty
      1056 -> :rngp_nsname_attr_ancestor
      1057 -> :rngp_nsname_no_ns
      1058 -> :rngp_param_forbidden
      1059 -> :rngp_param_name_missing
      1060 -> :rngp_parentref_create_failed
      1061 -> :rngp_parentref_name_invalid
      1062 -> :rngp_parentref_no_name
      1063 -> :rngp_parentref_no_parent
      1064 -> :rngp_parentref_not_empty
      1065 -> :rngp_parse_error
      1066 -> :rngp_pat_anyname_except_anyname
      1067 -> :rngp_pat_attr_attr
      1068 -> :rngp_pat_attr_elem
      1069 -> :rngp_pat_data_except_attr
      1070 -> :rngp_pat_data_except_elem
      1071 -> :rngp_pat_data_except_empty
      1072 -> :rngp_pat_data_except_group
      1073 -> :rngp_pat_data_except_interleave
      1074 -> :rngp_pat_data_except_list
      1075 -> :rngp_pat_data_except_onemore
      1076 -> :rngp_pat_data_except_ref
      1077 -> :rngp_pat_data_except_text
      1078 -> :rngp_pat_list_attr
      1079 -> :rngp_pat_list_elem
      1080 -> :rngp_pat_list_interleave
      1081 -> :rngp_pat_list_list
      1082 -> :rngp_pat_list_ref
      1083 -> :rngp_pat_list_text
      1084 -> :rngp_pat_nsname_except_anyname
      1085 -> :rngp_pat_nsname_except_nsname
      1086 -> :rngp_pat_onemore_group_attr
      1087 -> :rngp_pat_onemore_interleave_attr
      1088 -> :rngp_pat_start_attr
      1089 -> :rngp_pat_start_data
      1090 -> :rngp_pat_start_empty
      1091 -> :rngp_pat_start_group
      1092 -> :rngp_pat_start_interleave
      1093 -> :rngp_pat_start_list
      1094 -> :rngp_pat_start_onemore
      1095 -> :rngp_pat_start_text
      1096 -> :rngp_pat_start_value
      1097 -> :rngp_prefix_undefined
      1098 -> :rngp_ref_create_failed
      1099 -> :rngp_ref_cycle
      1100 -> :rngp_ref_name_invalid
      1101 -> :rngp_ref_no_def
      1102 -> :rngp_ref_no_name
      1103 -> :rngp_ref_not_empty
      1104 -> :rngp_start_choice_and_interleave
      1105 -> :rngp_start_content
      1106 -> :rngp_start_empty
      1107 -> :rngp_start_missing
      1108 -> :rngp_text_expected
      1109 -> :rngp_text_has_child
      1110 -> :rngp_type_missing
      1111 -> :rngp_type_not_found
      1112 -> :rngp_type_value
      1113 -> :rngp_unknown_attribute
      1114 -> :rngp_unknown_combine
      1115 -> :rngp_unknown_construct
      1116 -> :rngp_unknown_type_lib
      1117 -> :rngp_uri_fragment
      1118 -> :rngp_uri_not_absolute
      1119 -> :rngp_value_empty
      1120 -> :rngp_value_no_content
      1121 -> :rngp_xmlns_name
      1122 -> :rngp_xml_ns
      1200 -> :xpath_expression_ok
      1201 -> :xpath_number_error
      1202 -> :xpath_unfinished_literal_error
      1203 -> :xpath_start_literal_error
      1204 -> :xpath_variable_ref_error
      1205 -> :xpath_undef_variable_error
      1206 -> :xpath_invalid_predicate_error
      1207 -> :xpath_expr_error
      1208 -> :xpath_unclosed_error
      1209 -> :xpath_unknown_func_error
      1210 -> :xpath_invalid_operand
      1211 -> :xpath_invalid_type
      1212 -> :xpath_invalid_arity
      1213 -> :xpath_invalid_ctxt_size
      1214 -> :xpath_invalid_ctxt_position
      1215 -> :xpath_memory_error
      1216 -> :xptr_syntax_error
      1217 -> :xptr_resource_error
      1218 -> :xptr_sub_resource_error
      1219 -> :xpath_undef_prefix_error
      1220 -> :xpath_encoding_error
      1221 -> :xpath_invalid_char_error
      1300 -> :tree_invalid_hex
      1301 -> :tree_invalid_dec
      1302 -> :tree_unterminated_entity
      1303 -> :tree_not_utf8
      1400 -> :save_not_utf8
      1401 -> :save_char_invalid
      1402 -> :save_no_doctype
      1403 -> :save_unknown_encoding
      1450 -> :regexp_compile_error
      1500 -> :io_unknown
      1501 -> :io_eacces
      1502 -> :io_eagain
      1503 -> :io_ebadf
      1504 -> :io_ebadmsg
      1505 -> :io_ebusy
      1506 -> :io_ecanceled
      1507 -> :io_echild
      1508 -> :io_edeadlk
      1509 -> :io_edom
      1510 -> :io_eexist
      1511 -> :io_efault
      1512 -> :io_efbig
      1513 -> :io_einprogress
      1514 -> :io_eintr
      1515 -> :io_einval
      1516 -> :io_eio
      1517 -> :io_eisdir
      1518 -> :io_emfile
      1519 -> :io_emlink
      1520 -> :io_emsgsize
      1521 -> :io_enametoolong
      1522 -> :io_enfile
      1523 -> :io_enodev
      1524 -> :io_enoent
      1525 -> :io_enoexec
      1526 -> :io_enolck
      1527 -> :io_enomem
      1528 -> :io_enospc
      1529 -> :io_enosys
      1530 -> :io_enotdir
      1531 -> :io_enotempty
      1532 -> :io_enotsup
      1533 -> :io_enotty
      1534 -> :io_enxio
      1535 -> :io_eperm
      1536 -> :io_epipe
      1537 -> :io_erange
      1538 -> :io_erofs
      1539 -> :io_espipe
      1540 -> :io_esrch
      1541 -> :io_etimedout
      1542 -> :io_exdev
      1543 -> :io_network_attempt
      1544 -> :io_encoder
      1545 -> :io_flush
      1546 -> :io_write
      1547 -> :io_no_input
      1548 -> :io_buffer_full
      1549 -> :io_load_error
      1550 -> :io_enotsock
      1551 -> :io_eisconn
      1552 -> :io_econnrefused
      1553 -> :io_enetunreach
      1554 -> :io_eaddrinuse
      1555 -> :io_ealready
      1556 -> :io_eafnosupport
      1600 -> :xinclude_recursion
      1601 -> :xinclude_parse_value
      1602 -> :xinclude_entity_def_mismatch
      1603 -> :xinclude_no_href
      1604 -> :xinclude_no_fallback
      1605 -> :xinclude_href_uri
      1606 -> :xinclude_text_fragment
      1607 -> :xinclude_text_document
      1608 -> :xinclude_invalid_char
      1609 -> :xinclude_build_failed
      1610 -> :xinclude_unknown_encoding
      1611 -> :xinclude_multiple_root
      1612 -> :xinclude_xptr_failed
      1613 -> :xinclude_xptr_result
      1614 -> :xinclude_include_in_include
      1615 -> :xinclude_fallbacks_in_include
      1616 -> :xinclude_fallback_not_in_include
      1617 -> :xinclude_deprecated_ns
      1618 -> :xinclude_fragment_id
      1650 -> :catalog_missing_attr
      1651 -> :catalog_entry_broken
      1652 -> :catalog_prefer_value
      1653 -> :catalog_not_catalog
      1654 -> :catalog_recursion
      1700 -> :schemap_prefix_undefined
      1701 -> :schemap_attrformdefault_value
      1702 -> :schemap_attrgrp_noname_noref
      1703 -> :schemap_attr_noname_noref
      1704 -> :schemap_complextype_noname_noref
      1705 -> :schemap_elemformdefault_value
      1706 -> :schemap_elem_noname_noref
      1707 -> :schemap_extension_no_base
      1708 -> :schemap_facet_no_value
      1709 -> :schemap_failed_build_import
      1710 -> :schemap_group_noname_noref
      1711 -> :schemap_import_namespace_not_uri
      1712 -> :schemap_import_redefine_nsname
      1713 -> :schemap_import_schema_not_uri
      1714 -> :schemap_invalid_boolean
      1715 -> :schemap_invalid_enum
      1716 -> :schemap_invalid_facet
      1717 -> :schemap_invalid_facet_value
      1718 -> :schemap_invalid_maxoccurs
      1719 -> :schemap_invalid_minoccurs
      1720 -> :schemap_invalid_ref_and_subtype
      1721 -> :schemap_invalid_white_space
      1722 -> :schemap_noattr_noref
      1723 -> :schemap_notation_no_name
      1724 -> :schemap_notype_noref
      1725 -> :schemap_ref_and_subtype
      1726 -> :schemap_restriction_noname_noref
      1727 -> :schemap_simpletype_noname
      1728 -> :schemap_type_and_subtype
      1729 -> :schemap_unknown_all_child
      1730 -> :schemap_unknown_anyattribute_child
      1731 -> :schemap_unknown_attr_child
      1732 -> :schemap_unknown_attrgrp_child
      1733 -> :schemap_unknown_attribute_group
      1734 -> :schemap_unknown_base_type
      1735 -> :schemap_unknown_choice_child
      1736 -> :schemap_unknown_complexcontent_child
      1737 -> :schemap_unknown_complextype_child
      1738 -> :schemap_unknown_elem_child
      1739 -> :schemap_unknown_extension_child
      1740 -> :schemap_unknown_facet_child
      1741 -> :schemap_unknown_facet_type
      1742 -> :schemap_unknown_group_child
      1743 -> :schemap_unknown_import_child
      1744 -> :schemap_unknown_list_child
      1745 -> :schemap_unknown_notation_child
      1746 -> :schemap_unknown_processcontent_child
      1747 -> :schemap_unknown_ref
      1748 -> :schemap_unknown_restriction_child
      1749 -> :schemap_unknown_schemas_child
      1750 -> :schemap_unknown_sequence_child
      1751 -> :schemap_unknown_simplecontent_child
      1752 -> :schemap_unknown_simpletype_child
      1753 -> :schemap_unknown_type
      1754 -> :schemap_unknown_union_child
      1755 -> :schemap_elem_default_fixed
      1756 -> :schemap_regexp_invalid
      1757 -> :schemap_failed_load
      1758 -> :schemap_nothing_to_parse
      1759 -> :schemap_noroot
      1760 -> :schemap_redefined_group
      1761 -> :schemap_redefined_type
      1762 -> :schemap_redefined_element
      1763 -> :schemap_redefined_attrgroup
      1764 -> :schemap_redefined_attr
      1765 -> :schemap_redefined_notation
      1766 -> :schemap_failed_parse
      1767 -> :schemap_unknown_prefix
      1768 -> :schemap_def_and_prefix
      1769 -> :schemap_unknown_include_child
      1770 -> :schemap_include_schema_not_uri
      1771 -> :schemap_include_schema_no_uri
      1772 -> :schemap_not_schema
      1773 -> :schemap_unknown_member_type
      1774 -> :schemap_invalid_attr_use
      1775 -> :schemap_recursive
      1776 -> :schemap_supernumerous_list_item_type
      1777 -> :schemap_invalid_attr_combination
      1778 -> :schemap_invalid_attr_inline_combination
      1779 -> :schemap_missing_simpletype_child
      1780 -> :schemap_invalid_attr_name
      1781 -> :schemap_ref_and_content
      1782 -> :schemap_ct_props_correct_1
      1783 -> :schemap_ct_props_correct_2
      1784 -> :schemap_ct_props_correct_3
      1785 -> :schemap_ct_props_correct_4
      1786 -> :schemap_ct_props_correct_5
      1787 -> :schemap_derivation_ok_restriction_1
      1788 -> :schemap_derivation_ok_restriction_2_1_1
      1789 -> :schemap_derivation_ok_restriction_2_1_2
      1790 -> :schemap_derivation_ok_restriction_2_2
      1791 -> :schemap_derivation_ok_restriction_3
      1792 -> :schemap_wildcard_invalid_ns_member
      1793 -> :schemap_intersection_not_expressible
      1794 -> :schemap_union_not_expressible
      1795 -> :schemap_src_import_3_1
      1796 -> :schemap_src_import_3_2
      1797 -> :schemap_derivation_ok_restriction_4_1
      1798 -> :schemap_derivation_ok_restriction_4_2
      1799 -> :schemap_derivation_ok_restriction_4_3
      1800 -> :schemap_cos_ct_extends_1_3
      1801 -> :schemav_noroot
      1802 -> :schemav_undeclaredelem
      1803 -> :schemav_nottoplevel
      1804 -> :schemav_missing
      1805 -> :schemav_wrongelem
      1806 -> :schemav_notype
      1807 -> :schemav_norollback
      1808 -> :schemav_isabstract
      1809 -> :schemav_notempty
      1810 -> :schemav_elemcont
      1811 -> :schemav_havedefault
      1812 -> :schemav_notnillable
      1813 -> :schemav_extracontent
      1814 -> :schemav_invalidattr
      1815 -> :schemav_invalidelem
      1816 -> :schemav_notdeterminist
      1817 -> :schemav_construct
      1818 -> :schemav_internal
      1819 -> :schemav_notsimple
      1820 -> :schemav_attrunknown
      1821 -> :schemav_attrinvalid
      1822 -> :schemav_value
      1823 -> :schemav_facet
      1824 -> :schemav_cvc_datatype_valid_1_2_1
      1825 -> :schemav_cvc_datatype_valid_1_2_2
      1826 -> :schemav_cvc_datatype_valid_1_2_3
      1827 -> :schemav_cvc_type_3_1_1
      1828 -> :schemav_cvc_type_3_1_2
      1829 -> :schemav_cvc_facet_valid
      1830 -> :schemav_cvc_length_valid
      1831 -> :schemav_cvc_minlength_valid
      1832 -> :schemav_cvc_maxlength_valid
      1833 -> :schemav_cvc_mininclusive_valid
      1834 -> :schemav_cvc_maxinclusive_valid
      1835 -> :schemav_cvc_minexclusive_valid
      1836 -> :schemav_cvc_maxexclusive_valid
      1837 -> :schemav_cvc_totaldigits_valid
      1838 -> :schemav_cvc_fractiondigits_valid
      1839 -> :schemav_cvc_pattern_valid
      1840 -> :schemav_cvc_enumeration_valid
      1841 -> :schemav_cvc_complex_type_2_1
      1842 -> :schemav_cvc_complex_type_2_2
      1843 -> :schemav_cvc_complex_type_2_3
      1844 -> :schemav_cvc_complex_type_2_4
      1845 -> :schemav_cvc_elt_1
      1846 -> :schemav_cvc_elt_2
      1847 -> :schemav_cvc_elt_3_1
      1848 -> :schemav_cvc_elt_3_2_1
      1849 -> :schemav_cvc_elt_3_2_2
      1850 -> :schemav_cvc_elt_4_1
      1851 -> :schemav_cvc_elt_4_2
      1852 -> :schemav_cvc_elt_4_3
      1853 -> :schemav_cvc_elt_5_1_1
      1854 -> :schemav_cvc_elt_5_1_2
      1855 -> :schemav_cvc_elt_5_2_1
      1856 -> :schemav_cvc_elt_5_2_2_1
      1857 -> :schemav_cvc_elt_5_2_2_2_1
      1858 -> :schemav_cvc_elt_5_2_2_2_2
      1859 -> :schemav_cvc_elt_6
      1860 -> :schemav_cvc_elt_7
      1861 -> :schemav_cvc_attribute_1
      1862 -> :schemav_cvc_attribute_2
      1863 -> :schemav_cvc_attribute_3
      1864 -> :schemav_cvc_attribute_4
      1865 -> :schemav_cvc_complex_type_3_1
      1866 -> :schemav_cvc_complex_type_3_2_1
      1867 -> :schemav_cvc_complex_type_3_2_2
      1868 -> :schemav_cvc_complex_type_4
      1869 -> :schemav_cvc_complex_type_5_1
      1870 -> :schemav_cvc_complex_type_5_2
      1871 -> :schemav_element_content
      1872 -> :schemav_document_element_missing
      1873 -> :schemav_cvc_complex_type_1
      1874 -> :schemav_cvc_au
      1875 -> :schemav_cvc_type_1
      1876 -> :schemav_cvc_type_2
      1877 -> :schemav_cvc_idc
      1878 -> :schemav_cvc_wildcard
      1879 -> :schemav_misc
      1900 -> :xptr_unknown_scheme
      1901 -> :xptr_childseq_start
      1902 -> :xptr_eval_failed
      1903 -> :xptr_extra_objects
      1950 -> :c14n_create_ctxt
      1951 -> :c14n_requires_utf8
      1952 -> :c14n_create_stack
      1953 -> :c14n_invalid_node
      1954 -> :c14n_unknow_node
      1955 -> :c14n_relative_namespace
      2000 -> :ftp_pasv_answer
      2001 -> :ftp_epsv_answer
      2002 -> :ftp_accnt
      2003 -> :ftp_url_syntax
      2020 -> :http_url_syntax
      2021 -> :http_use_ip
      2022 -> :http_unknown_host
      3000 -> :schemap_src_simple_type_1
      3001 -> :schemap_src_simple_type_2
      3002 -> :schemap_src_simple_type_3
      3003 -> :schemap_src_simple_type_4
      3004 -> :schemap_src_resolve
      3005 -> :schemap_src_restriction_base_or_simpletype
      3006 -> :schemap_src_list_itemtype_or_simpletype
      3007 -> :schemap_src_union_membertypes_or_simpletypes
      3008 -> :schemap_st_props_correct_1
      3009 -> :schemap_st_props_correct_2
      3010 -> :schemap_st_props_correct_3
      3011 -> :schemap_cos_st_restricts_1_1
      3012 -> :schemap_cos_st_restricts_1_2
      3013 -> :schemap_cos_st_restricts_1_3_1
      3014 -> :schemap_cos_st_restricts_1_3_2
      3015 -> :schemap_cos_st_restricts_2_1
      3016 -> :schemap_cos_st_restricts_2_3_1_1
      3017 -> :schemap_cos_st_restricts_2_3_1_2
      3018 -> :schemap_cos_st_restricts_2_3_2_1
      3019 -> :schemap_cos_st_restricts_2_3_2_2
      3020 -> :schemap_cos_st_restricts_2_3_2_3
      3021 -> :schemap_cos_st_restricts_2_3_2_4
      3022 -> :schemap_cos_st_restricts_2_3_2_5
      3023 -> :schemap_cos_st_restricts_3_1
      3024 -> :schemap_cos_st_restricts_3_3_1
      3025 -> :schemap_cos_st_restricts_3_3_1_2
      3026 -> :schemap_cos_st_restricts_3_3_2_2
      3027 -> :schemap_cos_st_restricts_3_3_2_1
      3028 -> :schemap_cos_st_restricts_3_3_2_3
      3029 -> :schemap_cos_st_restricts_3_3_2_4
      3030 -> :schemap_cos_st_restricts_3_3_2_5
      3031 -> :schemap_cos_st_derived_ok_2_1
      3032 -> :schemap_cos_st_derived_ok_2_2
      3033 -> :schemap_s4s_elem_not_allowed
      3034 -> :schemap_s4s_elem_missing
      3035 -> :schemap_s4s_attr_not_allowed
      3036 -> :schemap_s4s_attr_missing
      3037 -> :schemap_s4s_attr_invalid_value
      3038 -> :schemap_src_element_1
      3039 -> :schemap_src_element_2_1
      3040 -> :schemap_src_element_2_2
      3041 -> :schemap_src_element_3
      3042 -> :schemap_p_props_correct_1
      3043 -> :schemap_p_props_correct_2_1
      3044 -> :schemap_p_props_correct_2_2
      3045 -> :schemap_e_props_correct_2
      3046 -> :schemap_e_props_correct_3
      3047 -> :schemap_e_props_correct_4
      3048 -> :schemap_e_props_correct_5
      3049 -> :schemap_e_props_correct_6
      3050 -> :schemap_src_include
      3051 -> :schemap_src_attribute_1
      3052 -> :schemap_src_attribute_2
      3053 -> :schemap_src_attribute_3_1
      3054 -> :schemap_src_attribute_3_2
      3055 -> :schemap_src_attribute_4
      3056 -> :schemap_no_xmlns
      3057 -> :schemap_no_xsi
      3058 -> :schemap_cos_valid_default_1
      3059 -> :schemap_cos_valid_default_2_1
      3060 -> :schemap_cos_valid_default_2_2_1
      3061 -> :schemap_cos_valid_default_2_2_2
      3062 -> :schemap_cvc_simple_type
      3063 -> :schemap_cos_ct_extends_1_1
      3064 -> :schemap_src_import_1_1
      3065 -> :schemap_src_import_1_2
      3066 -> :schemap_src_import_2
      3067 -> :schemap_src_import_2_1
      3068 -> :schemap_src_import_2_2
      3069 -> :schemap_internal
      3070 -> :schemap_not_deterministic
      3071 -> :schemap_src_attribute_group_1
      3072 -> :schemap_src_attribute_group_2
      3073 -> :schemap_src_attribute_group_3
      3074 -> :schemap_mg_props_correct_1
      3075 -> :schemap_mg_props_correct_2
      3076 -> :schemap_src_ct_1
      3077 -> :schemap_derivation_ok_restriction_2_1_3
      3078 -> :schemap_au_props_correct_2
      3079 -> :schemap_a_props_correct_2
      3080 -> :schemap_c_props_correct
      3081 -> :schemap_src_redefine
      3082 -> :schemap_src_import
      3083 -> :schemap_warn_skip_schema
      3084 -> :schemap_warn_unlocated_schema
      3085 -> :schemap_warn_attr_redecl_proh
      3086 -> :schemap_warn_attr_pointless_proh
      3087 -> :schemap_ag_props_correct
      3088 -> :schemap_cos_ct_extends_1_2
      3089 -> :schemap_au_props_correct
      3090 -> :schemap_a_props_correct_3
      3091 -> :schemap_cos_all_limited
      4000 -> :schematronv_assert
      4001 -> :schematronv_report
      4900 -> :module_open
      4901 -> :module_close
      5000 -> :check_found_element
      5001 -> :check_found_attribute
      5002 -> :check_found_text
      5003 -> :check_found_cdata
      5004 -> :check_found_entityref
      5005 -> :check_found_entity
      5006 -> :check_found_pi
      5007 -> :check_found_comment
      5008 -> :check_found_doctype
      5009 -> :check_found_fragment
      5010 -> :check_found_notation
      5011 -> :check_unknown_node
      5012 -> :check_entity_type
      5013 -> :check_no_parent
      5014 -> :check_no_doc
      5015 -> :check_no_name
      5016 -> :check_no_elem
      5017 -> :check_wrong_doc
      5018 -> :check_no_prev
      5019 -> :check_wrong_prev
      5020 -> :check_no_next
      5021 -> :check_wrong_next
      5022 -> :check_not_dtd
      5023 -> :check_not_attr
      5024 -> :check_not_attr_decl
      5025 -> :check_not_elem_decl
      5026 -> :check_not_entity_decl
      5027 -> :check_not_ns_decl
      5028 -> :check_no_href
      5029 -> :check_wrong_parent
      5030 -> :check_ns_scope
      5031 -> :check_ns_ancestor
      5032 -> :check_not_utf8
      5033 -> :check_no_dict
      5034 -> :check_not_ncname
      5035 -> :check_outside_dict
      5036 -> :check_wrong_name
      5037 -> :check_name_not_null
      6000 -> :i18n_no_name
      6001 -> :i18n_no_handler
      6002 -> :i18n_excess_handler
      6003 -> :i18n_conv_failed
      6004 -> :i18n_no_output
      7000 -> :buf_overflow
      _ -> :unknown
    end
  end

  defp to_level(level) do
    case level do
      0 ->
        :err_none

      # A simple warning
      1 ->
        :err_warning

      # A recoverable error
      2 ->
        :err_error

      # A fatal error
      3 ->
        :err_fatal

      _ ->
        :unknown
    end
  end
end
