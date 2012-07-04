<%inherit file="/base.mako" />
<script type="text/javascript" src="/jquery.tablesorter.min.js"></script>

%for proposal_type in c.proposal_type_collection:
% if len(c.review_collection[proposal_type]):
<h2>Your ${ proposal_type.name } reviews</h2>
<table class="reviews">
  <thead>
    <tr>
      <th>Proposal title</th>
      <th>Score</th>
      <th>Stream</th>
      <th>Comment</th>
      <th>Edit</th>
    </tr>
  </thead>
  <tbody>
%   for r in c.review_collection[proposal_type]:
    <tr class="${ h.cycle('even', 'odd') }">
      <td>${ h.link_to("%s - %s" % (r.proposal.id, r.proposal.title), url=h.url_for(controller='review', action='edit', id=r.id)) }</td>
      <td>${ r.score |h }</td>
      <td>
%     if r.stream is not None:
        ${ r.stream.name |h }
%     else:
        (none)
%     endif
      </td>
      <td>${ h.truncate(r.comment) }</td>
      <td>${ h.link_to("edit", url=h.url_for(controller='review', action='edit', id=r.id)) }&nbsp;-&nbsp;${ h.link_to("delete", url=h.url_for(controller='review', action='delete', id=r.id)) }</td>
    </tr>

%   endfor
  </tbody>
</table>
% endif
%endfor
<script>
jQuery(".reviews").tablesorter();
</script>
<%def name="title()" >
Reviews - ${ parent.title() }
</%def>

