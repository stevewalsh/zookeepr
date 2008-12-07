%   if c.signed_in_person.volunteer:
%       if c.signed_in_person.paid():
        <p>
%           if c.signed_in_person.volunteer.accepted is None:
          Thank you for volunteering to help out at the conference.
          Your application is currently being reviewed and we will contact you shortly with the outcome.
%           elif c.signed_in_person.volunteer.accepted:
          Thank you for volunteering to help out at the conference.
          Your application has been accepted and we're looking forward to meeting you.
%           elif not c.signed_in_person.volunteer.accepted:
          Unfortunately your application to volunteer has not been accepted.
%           #endif
        </p>
%       else:
        <p>
          Thank you for volunteering to help out at the conference.
%           if c.signed_in_person.volunteer.accepted is None:
          Your application is currently being reviewed and we will contact you shortly with the outcome.
%           elif c.signed_in_person.volunteer.accepted:
          Your application has been accepted and we would like to invite you to register using the <% h.link_to('registration form', url=h.url(controller='registration', action='new')) %>.
%           elif not c.signed_in_person.volunteer.accepted:
          Unfortunately your application to volunteer has not been accepted. If you would still like to register to attend the conference as a delegate please fill out the <% h.link_to('registration form', url=h.url(controller='registration', action='new')) %>.
%           #endif
        </p>
%       #endif
%   #endif
