<?php

namespace App\Http\Controllers\Backend\Messaging;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Helpers\MyHelper;
use App\Models\MY_Model;

/**
 * Description of MailController
 *
 * @author User
 */
class MailController extends Controller {

    //put your code here
    protected $MY_Model;
    protected $table_default = 'tbl_e_messages';

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
    }

    public function compose(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Inbox</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config'));
    }

    public function inbox(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Inbox</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $_modal_data = [
            [
                'id' => "modal_attachment_mail",
                'path' => "Public_html.Modals.Extraweb.Message.modal_attachment_mail"
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', '_modal_data'));
    }

    public function sent(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Inbox</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $_modal_data = [
            [
                'id' => "modal_attachment_mail",
                'path' => "Public_html.Modals.Extraweb.Message.modal_attachment_mail"
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', '_modal_data'));
    }

    public function draft(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Draft</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $_modal_data = [
            [
                'id' => "modal_attachment_mail",
                'path' => "Public_html.Modals.Extraweb.Message.modal_attachment_mail"
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', '_modal_data'));
    }

    public function junk(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Junk</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $_modal_data = [
            [
                'id' => "modal_attachment_mail",
                'path' => "Public_html.Modals.Extraweb.Message.modal_attachment_mail"
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', '_modal_data'));
    }

    public function trash(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Inbox Messages',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/messaging/inbox'
            ]
        ];
        $_config = [
            'title_for_header' => 'Message <b>Trash</b>',
            'create_page' => [
                'title' => 'click to open compose message page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/messaging/compose'
            ]
        ];
        $_modal_data = [
            [
                'id' => "modal_attachment_mail",
                'path' => "Public_html.Modals.Extraweb.Message.modal_attachment_mail"
            ]
        ];
        $this->_init_notif($request);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', '_modal_data'));
    }

    public function get_list(Request $request) {
        if (isset($request) && !empty($request)) {
            switch ($request->a) {
                case 1:
                    $this->get_list_sent($request);
                    break;
                case 2:
                    return $this->_init_navbar_notif($request, true);
                    break;
                case 3:
                    return $this->get_list_draft($request);
                    break;
                case 4:
                    return $this->get_list_junk($request);
                    break;
                default :
                    $this->get_list_inbox($request);
                    break;
            }
        }
    }

    protected function get_list_inbox($request) {
        $draw = $request->draw;
        $limit = ($request->length) ? $request->length : 10;
        if ($request->length == '-1') {
            $limit = 1000;
        }
        $offset = ($request->start) ? $request->start : 0;
        $search = $request->search['value'];
        if (isset($search) && !empty($search)) {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_mail', '=', 1],
                    ['b.is_chat', '=', 0],
                    ['b.is_draft', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ],
                'orWhere' => [
                    ['a.code', 'like', '%' . $search . '%'],
                    ['a.subject', 'like', '%' . $search . '%'],
                    ['a.mail_to', 'like', '%' . $search . '%']
                ]
            ];
        } else {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_mail', '=', 1],
                    ['b.is_chat', '=', 0],
                    ['b.is_draft', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ]
            ];
        }
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.id', 'a.mail_from', 'a.mail_to',
                'b.code AS mail_code', 'b.subject', 'b.text', 'b.is_chat', 'b.is_mail', 'b.is_active', 'b.is_read_notification', 'b.created_by', 'b.created_date',
                'c.user_name', 'c.email'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_to'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => $conditions,
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => $limit,
            'offset' => $offset,
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if (isset($data['data']) && !empty($data['data'])) {
            $arrData = array();
            if ($offset == 0) {
                $i = 1;
            } else {
                $i = ($offset + 1);
            }
            foreach ($data['data'] AS $keyword => $value) {
                $attachment_files = $this->fnGetAttachmentFiles($request, $value->id);
                $attach = '';
                if (isset($attachment_files['data']) && !empty($attachment_files['data']) && $attachment_files['data']) {
                    $attach = '<i class="fas fa-paperclip"></i>';
                }
                $strHtml = '<tr><td>
                            <div class="row">
                                <div class="col-md-1 icheck-primary">
                                    <input type="checkbox" class="chkMailbox" name="chkMailbox" value="' . $value->id . '" id="check' . $value->id . '">
                                    <label for="check' . $value->id . '"></label>
                                </div>
                            <div class="col-md-1 mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></div>
                            <div class="col-md-3 mailbox-name"><a href="read-mail.html">' . $value->email . '</a></div>
                            <div class="col-md-3 mailbox-subject">' . $value->subject . '</div>
                            <div class="col-md-2 mailbox-attachment">' . $attach . '</div>
                            <div class="col-md-2 mailbox-date">' . $this->MyHelper->fnDateDiff($value->created_date, $this->MyHelper->getDateNow(), false, true) . '</div></div></td></tr>';
                $arrData[] = ['data' => $strHtml];
                if ($i <= $data['meta']['total']) {
                    $i++;
                }
            }
            $output = array(
                'draw' => $draw,
                'recordsTotal' => $data['meta']['total'],
                'recordsFiltered' => $data['meta']['total'],
                'data' => $arrData,
            );
            echo json_encode($output);
        } else {
            echo json_encode(array());
        }
    }

    protected function get_list_draft($request) {
        $draw = $request->draw;
        $limit = ($request->length) ? $request->length : 10;
        if ($request->length == '-1') {
            $limit = 1000;
        }
        $offset = ($request->start) ? $request->start : 0;
        $search = $request->search['value'];
        if (isset($search) && !empty($search)) {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_draft', '=', 1],
                    ['b.is_mail', '=', 0],
                    ['b.is_chat', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ],
                'orWhere' => [
                    ['a.code', 'like', '%' . $search . '%'],
                    ['a.subject', 'like', '%' . $search . '%'],
                    ['a.mail_to', 'like', '%' . $search . '%']
                ]
            ];
        } else {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_draft', '=', 1],
                    ['b.is_mail', '=', 0],
                    ['b.is_chat', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ]
            ];
        }
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.id', 'a.mail_from', 'a.mail_to',
                'b.code AS mail_code', 'b.subject', 'b.text', 'b.is_chat', 'b.is_mail', 'b.is_active', 'b.is_read_notification', 'b.created_by', 'b.created_date',
                'c.user_name', 'c.email'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_to'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => $conditions,
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => $limit,
            'offset' => $offset,
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if (isset($data['data']) && !empty($data['data'])) {
            $arrData = array();
            if ($offset == 0) {
                $i = 1;
            } else {
                $i = ($offset + 1);
            }
            foreach ($data['data'] AS $keyword => $value) {
                $attachment_files = $this->fnGetAttachmentFiles($request, $value->id);
                $attach = '';
                if (isset($attachment_files['data']) && !empty($attachment_files['data']) && $attachment_files['data']) {
                    $attach = '<i class="fas fa-paperclip"></i>';
                }
                $strHtml = '<tr><td>
                            <div class="row">
                                <div class="col-md-1 icheck-primary">
                                    <input type="checkbox" class="chkMailbox" name="chkMailbox" value="' . $value->id . '" id="check' . $value->id . '">
                                    <label for="check' . $value->id . '"></label>
                                </div>
                            <div class="col-md-1 mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></div>
                            <div class="col-md-3 mailbox-name"><a href="read-mail.html">' . $value->email . '</a></div>
                            <div class="col-md-3 mailbox-subject">' . $value->subject . '</div>
                            <div class="col-md-2 mailbox-attachment">' . $attach . '</div>
                            <div class="col-md-2 mailbox-date">' . $this->MyHelper->fnDateDiff($value->created_date, $this->MyHelper->getDateNow(), false, true) . '</div></div></td></tr>';
                $arrData[] = ['data' => $strHtml];
                if ($i <= $data['meta']['total']) {
                    $i++;
                }
            }
            $output = array(
                'draw' => $draw,
                'recordsTotal' => $data['meta']['total'],
                'recordsFiltered' => $data['meta']['total'],
                'data' => $arrData,
            );
            echo json_encode($output);
        } else {
            echo json_encode(array());
        }
    }
    
    protected function get_list_junk($request) {
        $draw = $request->draw;
        $limit = ($request->length) ? $request->length : 10;
        if ($request->length == '-1') {
            $limit = 1000;
        }
        $offset = ($request->start) ? $request->start : 0;
        $search = $request->search['value'];
        if (isset($search) && !empty($search)) {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_junk', '=', 1],
                    ['b.is_draft', '=', 0],
                    ['b.is_mail', '=', 0],
                    ['b.is_chat', '=', 0],
                    ['b.is_trash', '=', 0]
                ],
                'orWhere' => [
                    ['a.code', 'like', '%' . $search . '%'],
                    ['a.subject', 'like', '%' . $search . '%'],
                    ['a.mail_to', 'like', '%' . $search . '%']
                ]
            ];
        } else {
            $conditions = [
                'where' => [
                    ['a.mail_to', '=', $this->__user_id],
                    ['b.is_junk', '=', 1],
                    ['b.is_draft', '=', 0],
                    ['b.is_mail', '=', 0],
                    ['b.is_chat', '=', 0],
                    ['b.is_trash', '=', 0]
                ]
            ];
        }
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.id', 'a.mail_from', 'a.mail_to',
                'b.code AS mail_code', 'b.subject', 'b.text', 'b.is_chat', 'b.is_mail', 'b.is_active', 'b.is_read_notification', 'b.created_by', 'b.created_date',
                'c.user_name', 'c.email'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_to'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => $conditions,
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => $limit,
            'offset' => $offset,
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if (isset($data['data']) && !empty($data['data'])) {
            $arrData = array();
            if ($offset == 0) {
                $i = 1;
            } else {
                $i = ($offset + 1);
            }
            foreach ($data['data'] AS $keyword => $value) {
                $attachment_files = $this->fnGetAttachmentFiles($request, $value->id);
                $attach = '';
                if (isset($attachment_files['data']) && !empty($attachment_files['data']) && $attachment_files['data']) {
                    $attach = '<i class="fas fa-paperclip"></i>';
                }
                $strHtml = '<tr><td>
                            <div class="row">
                                <div class="col-md-1 icheck-primary">
                                    <input type="checkbox" class="chkMailbox" name="chkMailbox" value="' . $value->id . '" id="check' . $value->id . '">
                                    <label for="check' . $value->id . '"></label>
                                </div>
                            <div class="col-md-1 mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></div>
                            <div class="col-md-3 mailbox-name"><a href="read-mail.html">' . $value->email . '</a></div>
                            <div class="col-md-3 mailbox-subject">' . $value->subject . '</div>
                            <div class="col-md-2 mailbox-attachment">' . $attach . '</div>
                            <div class="col-md-2 mailbox-date">' . $this->MyHelper->fnDateDiff($value->created_date, $this->MyHelper->getDateNow(), false, true) . '</div></div></td></tr>';
                $arrData[] = ['data' => $strHtml];
                if ($i <= $data['meta']['total']) {
                    $i++;
                }
            }
            $output = array(
                'draw' => $draw,
                'recordsTotal' => $data['meta']['total'],
                'recordsFiltered' => $data['meta']['total'],
                'data' => $arrData,
            );
            echo json_encode($output);
        } else {
            echo json_encode(array());
        }
    }
    protected function get_list_sent($request) {
        $draw = $request->draw;
        $limit = ($request->length) ? $request->length : 10;
        if ($request->length == '-1') {
            $limit = 1000;
        }
        $offset = ($request->start) ? $request->start : 0;
        $search = $request->search['value'];
        if (isset($search) && !empty($search)) {
            $conditions = [
                'where' => [
                    ['a.mail_from', '=', $this->__user_id],
                    ['b.is_mail', '=', 1],
                    ['b.is_chat', '=', 0],
                    ['b.is_draft', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ],
                'orWhere' => [
                    ['a.code', 'like', '%' . $search . '%'],
                    ['a.subject', 'like', '%' . $search . '%'],
                    ['a.mail_from', 'like', '%' . $search . '%']
                ]
            ];
        } else {
            $conditions = [
                'where' => [
                    ['a.mail_from', '=', $this->__user_id],
                    ['b.is_mail', '=', 1],
                    ['b.is_chat', '=', 0],
                    ['b.is_draft', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ]
            ];
        }
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.id', 'a.mail_from', 'a.mail_to',
                'b.code AS mail_code', 'b.subject', 'b.text', 'b.is_chat', 'b.is_mail', 'b.is_active', 'b.is_read_notification', 'b.created_by', 'b.created_date',
                'c.user_name', 'c.email'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_to'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => $conditions,
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => $limit,
            'offset' => $offset,
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if (isset($data['data']) && !empty($data['data'])) {
            $arrData = array();
            if ($offset == 0) {
                $i = 1;
            } else {
                $i = ($offset + 1);
            }
            foreach ($data['data'] AS $keyword => $value) {
                $attachment_files = $this->fnGetAttachmentFiles($request, $value->id);
                $attach = '';
                if (isset($attachment_files['data']) && !empty($attachment_files['data']) && $attachment_files['data']) {
                    $attach = '<i class="fas fa-paperclip"></i>';
                }
                $strHtml = '<tr><td>
                            <div class="row">
                                <div class="col-md-1 icheck-primary">
                                    <input type="checkbox" value="" id="check' . $value->id . '">
                                    <label for="check' . $value->id . '"></label>
                                </div>
                            <div class="col-md-1 mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></div>
                            <div class="col-md-3 mailbox-name"><a href="read-mail.html">' . $value->email . '</a></div>
                            <div class="col-md-3 mailbox-subject">' . $value->subject . '</div>
                            <div class="col-md-2 mailbox-attachment">' . $attach . '</div>
                            <div class="col-md-2 mailbox-date">' . $this->MyHelper->fnDateDiff($value->created_date, $this->MyHelper->getDateNow(), false, true) . '</div></div></td></tr>';
                $arrData[] = ['data' => $strHtml];
                if ($i <= $data['meta']['total']) {
                    $i++;
                }
            }
            $output = array(
                'draw' => $draw,
                'recordsTotal' => $data['meta']['total'],
                'recordsFiltered' => $data['meta']['total'],
                'data' => $arrData,
            );
            echo json_encode($output);
        } else {
            echo json_encode(array());
        }
    }

    public function insert(Request $request) {
        $data = $request->all();
        if (isset($data) && !empty($data)) {
            $files = $request->file('attachment');
            $filename = [];
            $mail_code = $this->MyHelper->getRandomChar(12);
            if (isset($files) && !empty($files)) {
                $id = 0;
                foreach ($files AS $k => $v) {
                    $file_path = DIRECTORY_SEPARATOR . 'files' . DIRECTORY_SEPARATOR . 'messaging' . DIRECTORY_SEPARATOR;
                    $path = config('app.base_media_root') . $file_path;
                    if (!is_dir($path)) {
                        mkdir($path);
                    }
                    $upload_path = $path . $mail_code . DIRECTORY_SEPARATOR;
                    if (!is_dir($upload_path)) {
                        mkdir($upload_path);
                    }
                    $upload = $files[$id]->move($upload_path, $v->getClientOriginalName());
                    if ($upload) {
                        $filename[] = ['path' => config('app.base_media_uri') . $file_path . $v->getClientOriginalName()];
                    }
                    $id++;
                }
            }
            switch ($data['a']) {
                case "1":
                    $is_draft = 1;
                    $is_junk = 0;
                    break;
                case "2":
                    $is_draft = 0;
                    $is_junk = 1;
                    break;
                default:
                    $is_draft = 0;
                    $is_junk = 0;
                    break;
            };
            $param = [
                'code' => $mail_code,
                'subject' => $data['subject'],
                'text' => $data['text'],
                'is_active' => 1,
                'is_chat' => 0,
                'is_mail' => 1,
                'is_draft' => $is_draft,
                'is_junk' => $is_junk,
                'is_read_notification' => 0,
                'created_by' => $this->__user_id,
                'created_date' => $this->MyHelper->getDateNow(),
                'updated_by' => $this->__user_id,
                'updated_date' => $this->MyHelper->getDateNow()
            ];
            $mail_id = DB::Connection('mysql')->table('tbl_e_messages')->insertGetId($param);
            if ($mail_id) {
                if (isset($data['to']) && !empty($data['to'])) {
                    $param_mail_send = [];
                    foreach ($data['to'] AS $k => $v) {
                        $param_mail_send[] = [
                            'mail_from' => $this->__user_email,
                            'mail_to' => $v,
                            'mail_id' => $mail_id,
                            'is_active' => 1,
                            'created_by' => $this->__user_id,
                            'created_date' => $this->MyHelper->getDateNow(),
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->MyHelper->getDateNow()
                        ];
                    }
                    DB::Connection('mysql')->table('tbl_e_message_send')->insert($param_mail_send);
                }
                if (isset($filename) && !empty($filename)) {
                    $param_mail_attach = [];
                    foreach ($filename AS $key => $value) {
                        $param_mail_attach[] = [
                            'title' => $data['subject'],
                            'mail_id' => $mail_id,
                            'path' => $value['path'],
                            'is_active' => 1,
                            'created_by' => $this->__user_id,
                            'created_date' => $this->MyHelper->getDateNow(),
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->MyHelper->getDateNow()
                        ];
                    }
                    DB::Connection('mysql')->table('tbl_e_message_attachments')->insert($param_mail_attach);
                }
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully insert data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed insert data.', 'valid' => false]);
            }
        }
    }

    public function update(Request $request, $pr_id = null) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $id = base64_decode($pr_id);
            switch ($data['action']) {
                case 'is_basic':
                    $update_data = [
                        'is_basic' => $data['is_basic'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                case 'is_public':
                    $update_data = [
                        'is_public' => $data['is_public'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                case 'is_active':
                    $update_data = [
                        'is_active' => $data['is_active'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                default:
                    $update_data = [
                        'name' => $data['name'],
                        'path' => $data['path'],
                        'controller' => $data['controller'],
                        'method' => $data['method'],
                        'description' => isset($data['description']) ? $data['description'] : '-',
                        'is_basic' => isset($data['is_basic']) ? 1 : 0,
                        'is_public' => isset($data['is_public']) ? 1 : 0,
                        'is_active' => isset($data['is_active']) ? 1 : 0,
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
            }
            $response = DB::table($this->table_default)->where('id', '=', (int) $id)->update($update_data);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed update data.', 'valid' => false]);
            }
        }
    }

}
