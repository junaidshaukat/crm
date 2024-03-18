## 01 Public (03)

1. api/admin/v1/auth/login
2. api/admin/v1/auth/resetPassword
3. api/admin/v1/auth/forgetPassword

---

## 02 Dashboard (18)

1.  api/admin/v1/dashboard/numberOfFollowers
2.  api/admin/v1/dashboard/totalTransactions
3.  api/admin/v1/dashboard/totalTransactionsOfYear
4.  api/admin/v1/dashboard/totalDonations
5.  api/admin/v1/dashboard/totalDonationOfYear
6.  api/admin/v1/dashboard/daySummary
7.  api/admin/v1/dashboard/monthSummary
8.  api/admin/v1/dashboard/setOrganization
9.  api/admin/v1/dashboard/campaignSummary
10. api/admin/v1/dashboard/campaignYearSummary
11. api/admin/v1/dashboard/campaignYearMonthSummary
12. api/admin/v1/dashboard/campaignYearMonthDaySummary
13. api/admin/v1/dashboard/recurring
14. api/admin/v1/auth/profile
15. api/admin/v1/routeLov

---

## 03 Analytics (22)

1.  api/admin/v1/dashboard/yearOverYears
2.  api/admin/v1/dashboard/tenderTypes
3.  api/admin/v1/dashboard/channelTypeSummary
4.  api/admin/v1/dashboard/receipted

---

## 04 Campaign (31)

1.  api/admin/v1/campaign (get campaigns)
2.  api/admin/v1/lov (get campaign filter controll)
3.  api/admin/v1/campaign/$tagNumber (delete campaign)
4.  api/admin/v1/qrCode (download qr code)
5.  api/admin/v1/icon (get icons for create campaign)
6.  api/admin/v1/node (get nodes for create campaign)
7.  api/admin/v1/campaign (create campaign)
8.  api/admin/v1/campaign/$tagNumber (update campaign)
9.  api/admin/v1/icon (get icons for update campaign)

---

## 05 Donor (40)

1.  api/admin/v1/donor/donor (get donors)
2.  api/admin/v1/lov (get donor filter controll)
3.  api/admin/v1/donor/donor/$tagNumber (delete donor)
4.  api/v1/public/country (get country for donor)
5.  api/v1/public/state (get state for donor)
6.  api/admin/v1/donor/donor (create donor)
7.  api/v1/public/country (get country for update donor)
8.  api/v1/public/state (get state for update donor)
9.  api/admin/v1/donor/donor/$tagNumber (update donor)

---

## 06 More (42)

1.  api/admin/v1/auth/profile
2.  api/admin/v1/auth/logout

---

## 07 Users (46)

1.  api/admin/v1/user (get users)
2.  api/admin/v1/user/$tagNumber (delete user)
3.  api/admin/v1/user (create user)
4.  api/admin/v1/user/$tagNumber (update user)

---

## 08 Report (49)

1. api/admin/v1/report
2. api/admin/v1/report/$tagNumber
3. api/admin/v1/reportHelper/preview

---

## 09 Channel (54)

1.  api/admin/v1/channel (get channel)
2.  api/admin/v1/channelSummary (get channel summary)
3.  api/admin/v1/channel (update channel)
4.  api/admin/v1/routeLov (get filter controlls values)
5.  api/admin/v1/lov (get filter controll)

## 10 Organization (67)

1. api/admin/v1/organization (get organization)
2. api/admin/v1/organization/$tagNumber (update organization profile)
3. api/v1/public/country (get country for update organization address)
4. api/v1/public/states (get states for update organization address)
5. api/admin/v1/organization/$tagNumber (update organization address)
6. api/admin/v1/organization/$tagNumber (update organization supplementary)
7. api/admin/v1/qrCode (download organization qr code)
8. api/admin/v1/organization/$tagNumber (update charity profile)
9. api/admin/v1/signature?\_method=PUT (update charity signature)
10. api/admin/v1/organization/$tagNumber (update charity supplementary)
11. api/admin/v1/organization/$tagNumber (update organization contact)
12. api/v1/public/states (get states for update charity address)
13. api/admin/v1/organization/$tagNumber (update charity address)

## 11 Media Center (74)

1.  api/admin/v1/widget (get widget)
2.  api/admin/v1/widget (update widget)
3.  api/admin/v1/media (get media)
4.  api/admin/v1/lov (get filter controll)
5.  api/admin/v1/media (update media)
6.  api/admin/v1/media (delete media)
7.  api/admin/v1/media (create media)

## 12 Transactions (82)

1.  api/admin/v1/routeLov?routeName=transaction
2.  api/admin/v1/lov?listName=transactionFilter
3.  api/admin/v1/transaction (get)
4.  api/admin/v1/transaction/sendInvoice
5.  api/admin/v1/transaction/updateEmail
6.  api/admin/v1/transaction/cardTransaction
7.  api/admin/v1/donor/payment/wallet
8.  api/admin/v1/transaction/data/export
