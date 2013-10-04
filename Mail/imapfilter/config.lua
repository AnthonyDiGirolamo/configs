options.timeout = 30
options.subscribe = true
options.cache = true
options.info = true

account1 = IMAP {
    server = 'mail.ornl.gov',
    username = 'lmd',
    password = '',
    ssl = 'ssl3',
}

-- Get a list of the available mailboxes and folders
mailboxes, folders = account1:list_all()

-- Get a list of the subscribed mailboxes and folders
--mailboxes, folders = account1:list_subscribed()

--account1:create_mailbox('Friends')
--account1:subscribe_mailbox('Friends')
--
--account1:subscribe_mailbox('rt-log')
--account1:subscribe_mailbox('uag')

-- Get the status of a mailbox
account1.INBOX:check_status()

-- Get all the messages in the mailbox.
--results = account1.INBOX:select_all()

unseen_messages = account1.INBOX:is_unseen()

results = unseen_messages:match_from('rt-log@ccs.ornl.gov')
results:move_messages(account1['rt-log'])

results = unseen_messages:match_from('rt-ccs_account@ccs.ornl.gov') +
          unseen_messages:match_from('rt-accounts-log@ccs.ornl.gov')
results:move_messages(account1['rt-accounts'])

results = unseen_messages:match_subject('NCCS Downtime Report for') +
          unseen_messages:match_subject('New user notification') +
          unseen_messages:match_subject('NCCS Oncall Rotation') +
          unseen_messages:match_subject('Downtime database populated')
results:move_messages(account1['uag-notifications'])

results = unseen_messages:match_to('nccs-uag@email.ornl.gov')
results:move_messages(account1['uag'])

results = unseen_messages:match_from('rt-acceptance@ccs.ornl.gov') +
          unseen_messages:match_from('rt-acceptance-comment@ccs.ornl.gov') +
          unseen_messages:match_to('titan-acceptance@ccs.ornl.gov') +
          unseen_messages:match_cc('titan-acceptance@ccs.ornl.gov')
results:move_messages(account1['titan'])

results = unseen_messages:match_from('help@nccs.gov') +
          unseen_messages:match_from('ua-forms@ccs.ornl.gov')
results:move_messages(account1['rt-ccs'])

results = unseen_messages:match_to('ncrc-status@ccs.ornl.gov')
results:move_messages(account1['ncrc-status'])

results = unseen_messages:match_from('help@ncrc.gov')
results:move_messages(account1['ncrc-rt'])

results = unseen_messages:match_from('rt-software@ccs.ornl.gov')
results:move_messages(account1['rt-sw'])

--results:mark_flagged()

-- -- Copy messages between mailboxes at the same account.
-- results:copy_messages(account1.news)
--
-- -- Get messages with the specified "From" header but without the
-- -- specified "Subject" header.
-- results = account1.INBOX:contain_from('announce@my.unix.os') -
--           account1.INBOX:contain_subject('security advisory')
--
-- -- Copy messages between mailboxes at a different account.
-- results:copy_messages(account2.security)
--
-- -- Get messages with any of the specified headers.
-- results = account1.INBOX:contain_from('marketing@company.junk') +
--           account1.INBOX:contain_from('advertising@annoying.promotion') +
--           account1.INBOX:contain_subject('new great products')
--
-- -- Delete messages.
-- results:delete_messages()
--
-- -- Get messages with the specified "Sender" header, which are older than
-- -- 30 days.
-- results = account1.INBOX:contain_field('sender', 'owner@announce-list') *
--           account1.INBOX:is_older(30)
--
-- -- Move messages to the "announce" mailbox inside the "lists" folder.
-- results:move_messages(account1['lists/announce'])
--
-- -- Get messages, in the "devel" mailbox inside the "lists" folder, with the
-- -- specified "Subject" header and a size less than 50000 octets (bytes).
-- results = account1['lists/devel']:contain_subject('[patch]') *
--           account1['lists/devel']:is_smaller(50000)
--
-- -- Move messages to the "patch" mailbox.
-- results:move_messages(account2.patch)
--
-- -- Get recent, unseen messages, that have either one of the specified
-- -- "From" headers, but do not have the specified pattern in the body of
-- -- the message.
-- results = ( account1.INBOX:is_recent() *
--             account1.INBOX:is_unseen() *
--             ( account1.INBOX:contain_from('tux@penguin.land') +
--               account1.INBOX:contain_from('beastie@daemon.land') ) ) -
--           account1.INBOX:match_body('.*all.work.and.no.play.*')
--
--
-- -- Get all messages in two mailboxes residing in the same server.
-- results = account1.news:select_all() +
--           account1.security:select_all()
--
-- -- Mark messages as seen.
-- results:mark_seen()
--
-- -- Get recent messages in two mailboxes residing in different servers.
-- results = account1.INBOX:is_recent() +
--           account2.INBOX:is_recent()
--
-- -- Flag messages as seen and important.
-- results:add_flags({ '\\Seen', '\\Flagged' })
--
-- -- Get unseen messages.
-- results = account1.INBOX:is_unseen()
--
-- -- From the messages that were unseen, match only those with the specified
-- -- regular expression in the header.
-- newresults = results:match_header('^.+MailScanner.*Check: [Ss]pam$')
--
-- -- Delete those messages.
-- newresults:delete_messages()
