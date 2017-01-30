- On your splash page include a brief description of what your page does.

- Put some space between your buttons at the profile page.

- On the Edit Assignment page, make the button save "Save Assignment" or something like that. "Edit Assignment!" can be confusing.

- When trying to add a student to the course without there being any students in the DB the app crashes. Have "NO STUDENTS ENROLLED" or something like that in the drop down menu to handle this error. Or make the button nonclickable when there are no students.

- Are students not able to edit their profile?  I see the route and the views but I am unable to go there from a student profile view

- I really like the look and feel of your buttons when adding/removing students and generally navigating around. Good job.  Materialize is great.  Have you viewed your page source, though? Tons of crazy calls to the filesystem for materialize:


```html  
<script src="/assets/materialize/initial.self-79f269ead2aeaa809299033919f9128fa0d9700d0248cad0dcd6442ce43dc389.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/jquery.easing.1.3.self-0170bc905fbddc075a56bdccce1be6a58f3713a14137b607ba9bd9f96fd7835f.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/animation.self-a1028b0bcf2e26331bedf7b90e81103f0707e69fdec488aa951de94b51987767.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/velocity.min.self-5adbb81af5c205a959e06198156b4b31fcd57f02c592e3fb096d7b74e8f401a6.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/hammer.min.self-bf8bdb0953b1a135f96716e362e1f7a8e64168c914fa77ca31973bb70e57a731.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/jquery.hammer.self-73fd69102f356b9abfc9ee242b19895f62454f42cfcfa1f066be71d2c8f41c7a.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/global.self-129ae9d94d9b02404fde8c95475cf68b887399e0d0ce1cf4d02810c646856c40.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/collapsible.self-f750f59687df0254e7c8551ee8f9dd7760ff414bd58b3dfa5c6b7ca9f339d047.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/dropdown.self-14bb35657a4d36f75511ac8b7e2462bd3d722f632989f33cc72184a71b57b522.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/modal.self-d8e758bee1fc4f982d27bde848c55711c5d4b544582e2e9a3aea817f8c0216e0.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/materialbox.self-e8e28686032e93f500d756bbf6dedeb69439cd8af4d1ca2732ee6ded8a77dbd9.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/parallax.self-5375f9f62fd8c9aaaba9ebca276180df1f102f575fff294e15ff56c15bcc25ba.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/tabs.self-efd58a7fce8d8dd622a50bcf2c6d64566ac68c60ab5ac95fe1a8ae100e284463.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/tooltip.self-8510c1a8da37f40d01e4d790e228be4c3c31d395396c013b12a9d1e0ae6afb76.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/waves.self-26e9b9cfaa9ccbc292ed510f654bd279d69695f5337a14c9800b36e92f96735b.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/toasts.self-966426db56709c13c339e94f7d8190dd8d501dfd20a8083b4ceb17925b3fe535.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/sideNav.self-da20dba95ebafbd44f9a065adbb507874d040245d01fa4edd889e4ea4611a047.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/scrollspy.self-7b7c280d198b38204b8ddd00e0936f8ee4c4a6bc728740233035ffc08bf99961.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/forms.self-0eddaa3eff9331e407f30bcb77759c1e21560a0d02d39def869b00f00bd6daac.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/slider.self-b650f99d1b28549db2e7d5b078540fa65aabbb2548e0a378a85cc6b4285fe438.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/cards.self-b78d84331c3b4ecca59db28b271bfd2cdc62d0703861ccbd13284e117b00f591.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/chips.self-75faa6eff0368d2b81319c143dfabf2ddf0e7770b075e007245ae61becb92645.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/pushpin.self-b6217071e4b33cf2ce5742d81537d6f36b046c5f8fd115a01e4239cff1acd598.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/buttons.self-b27d1a29f9142ca06ded6dee42c8668e6d7f3d5104f6d5dd04b8eef1afb7823d.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/transitions.self-93bbc15198f7eef0645597717d777abe2b3d3202f0ae6324d648a8d3e8f6b817.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/scrollFire.self-51d8aca762cd14871dbf39aad2bc0213e799f1aa314e75c267fdfd92cfd87e0e.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/date_picker/picker.self-7a9d1216fe1172f8e8fd78fb86cfd4da25c909ebd6983cba5da20817d437d92b.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/date_picker/picker.date.self-5924b278beda2df8570f137f72b37e2d0f516acbc11a0994d1abb74380f078ef.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/character_counter.self-6aeb1f2f7bfcbe4e54572fdaa629d7137c98d33e8b0bfd379ffb87ed0e10390a.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/carousel.self-34a2b97e1513fb51df375c3888c658b1b3cdb17add5dd8be45d7b61a5a55e2b4.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize-sprockets.self-1374c0ecff9f5520ea4a144c5754ae434cfea5ca52ec9af6e9916f20bd9275ed.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize.self-702a9d602423e239bf46b9fdb0212472a25756ffa32a30ed8628c5ed70164deb.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/materialize/extras/nouislider.self-088b6ebc2b70a59295866645a1858e4657be1306cc46da5fa5c39e8f7b4da4a1.js?body=1" data-turbolinks-track="reload">
```

I'd fix that ASAP


- At the `course/:id/assignment/:assignment_id` page I can't see a button to navigate back to the assignment page :(

- At the `course/:id` page I can add a student an infinite amount of times :(

- While viewing the list of assignments in the course show view it'd be nice to see if some statistics (submissions, average grade, etc.)  This would be a great opportunity to display some information via  snazzy looking table.


- I just noticed the subtle editable grades for students in the assignment view. Very nice!

- The student view for assignments is still showing some slightly off numbers for the average grade.

- Excellent mailer integration

- I'm seeing a lot of access_level checks in your controller. Nice. Students love to try to hack.

- Add more validations to your user creation. Maybe a valid email checker. Since you have mailers up and running, send them a verification email, which would be a good idea for keeping access to Teacher privileges away from Student level.
