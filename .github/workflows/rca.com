<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RAJE COMMERCE ACADEMY</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,500;0,9..144,600;0,9..144,700;1,9..144,500&family=Inter:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<style>
  :root{
    --ink:#16233D;
    --ink-soft:#2B3B5C;
    --paper:#F6F1E7;
    --paper-card:#FFFDF8;
    --brass:#E2672E;
    --brass-light:#F0A177;
    --ledger-green:#2F5233;
    --rule-red:#9B3B3B;
    --line:rgba(22,35,61,0.14);
    --shadow: 0 12px 30px rgba(22,35,61,0.10);
    --serif: 'Fraunces', serif;
    --sans: 'Inter', sans-serif;
    --mono: 'IBM Plex Mono', monospace;
  }
  *{box-sizing:border-box; margin:0; padding:0;}
  html{scroll-behavior:smooth;}
  body{
    background:var(--paper);
    color:var(--ink);
    font-family:var(--sans);
    line-height:1.6;
    -webkit-font-smoothing:antialiased;
  }
  a{color:inherit; text-decoration:none;}
  img{max-width:100%; display:block;}
  .wrap{max-width:1120px; margin:0 auto; padding:0 32px;}

  /* subtle ledger-line texture on the page background */
  body{
    background-image:
      repeating-linear-gradient(
        to bottom,
        transparent 0px,
        transparent 37px,
        rgba(22,35,61,0.035) 38px
      );
  }

  /* ===== NAV ===== */
  header{
    position:sticky; top:0; z-index:50;
    background:rgba(246,241,231,0.92);
    backdrop-filter:blur(6px);
    border-bottom:1px solid var(--line);
  }
  nav.wrap{
    display:flex; align-items:center; justify-content:space-between;
    height:78px;
  }
  .brand{
    display:flex; align-items:center; gap:12px;
    font-family:var(--serif); font-weight:600; font-size:1.22rem;
    letter-spacing:0.01em;
  }
  .brand-mark{
    width:52px; height:52px;
    display:flex; align-items:center; justify-content:center;
    flex-shrink:0;
  }
  .brand-mark img{width:100%; height:100%; object-fit:contain;}
  .brand small{
    display:block; font-family:var(--sans); font-weight:500; font-size:0.62rem;
    letter-spacing:0.16em; text-transform:uppercase; color:var(--ink-soft); margin-top:2px;
  }
  .nav-links{display:flex; gap:36px; align-items:center;}
  .nav-links a{
    font-size:0.88rem; font-weight:500; color:var(--ink-soft);
    position:relative; padding:4px 0;
  }
  .nav-links a::after{
    content:''; position:absolute; left:0; bottom:0; width:0; height:1.5px;
    background:var(--brass); transition:width .25s ease;
  }
  .nav-links a:hover::after{width:100%;}
  .nav-cta{
    background:var(--ink); color:var(--paper) !important; padding:10px 20px;
    border-radius:3px; font-size:0.85rem; font-weight:600;
  }
  .nav-cta::after{display:none;}
  .nav-cta:hover{background:var(--ink-soft);}
  .burger{display:none; background:none; border:none; cursor:pointer;}

  /* ===== HERO — ledger register ===== */
  .hero{padding:90px 0 60px;}
  .hero-grid{
    display:grid; grid-template-columns:1.05fr 0.95fr; gap:56px; align-items:start;
  }
  .eyebrow{
    font-family:var(--mono); font-size:0.74rem; letter-spacing:0.14em; text-transform:uppercase;
    color:var(--rule-red); display:flex; align-items:center; gap:10px; margin-bottom:22px;
  }
  .eyebrow::before{content:''; width:26px; height:1px; background:var(--rule-red);}
  h1{
    font-family:var(--serif); font-weight:600; font-size:3.4rem; line-height:1.08;
    letter-spacing:-0.01em; color:var(--ink); margin-bottom:24px;
  }
  h1 em{font-style:italic; color:var(--ledger-green); font-weight:500;}
  .hero p.lede{
    font-size:1.08rem; color:var(--ink-soft); max-width:480px; margin-bottom:34px;
  }
  .hero-ctas{display:flex; gap:14px; flex-wrap:wrap;}
  .btn-primary{
    background:var(--ink); color:var(--paper); padding:15px 28px; border-radius:3px;
    font-weight:600; font-size:0.92rem; display:inline-block; border:1px solid var(--ink);
    transition:all .2s ease;
  }
  .btn-primary:hover{background:transparent; color:var(--ink);}
  .btn-secondary{
    padding:15px 28px; border-radius:3px; font-weight:600; font-size:0.92rem;
    border:1px solid var(--ink); color:var(--ink); display:inline-block; transition:all .2s ease;
  }
  .btn-secondary:hover{background:var(--ink); color:var(--paper);}

  /* the ledger card */
  .ledger-card{
    background:var(--paper-card); border:1px solid var(--line); border-radius:6px;
    box-shadow:var(--shadow); overflow:hidden; position:relative;
  }
  .ledger-card::before{
    content:''; position:absolute; left:52px; top:0; bottom:0; width:1px; background:var(--rule-red); opacity:0.35;
  }
  .ledger-head{
    display:grid; grid-template-columns:52px 1fr 100px;
    padding:16px 20px; border-bottom:1.5px solid var(--ink);
    font-family:var(--mono); font-size:0.68rem; letter-spacing:0.1em; text-transform:uppercase;
    color:var(--ink-soft);
  }
  .ledger-row{
    display:grid; grid-template-columns:52px 1fr 100px;
    padding:17px 20px; border-bottom:1px solid var(--line); align-items:center;
    font-size:0.94rem;
  }
  .ledger-row:last-child{border-bottom:none;}
  .ledger-row .no{font-family:var(--mono); color:var(--brass); font-weight:600; font-size:0.85rem;}
  .ledger-row .subj{font-weight:600; color:var(--ink);}
  .ledger-row .subj span{
    display:block; font-weight:400; font-size:0.78rem; color:var(--ink-soft); margin-top:2px;
  }
  .tick{
    width:22px; height:22px; margin-left:auto; position:relative;
  }
  .tick svg{width:100%; height:100%;}
  .tick path{
    fill:none; stroke:var(--ledger-green); stroke-width:2.4; stroke-linecap:round; stroke-linejoin:round;
    stroke-dasharray:30; stroke-dashoffset:30;
    animation:draw 0.5s ease forwards;
  }
  @keyframes draw{to{stroke-dashoffset:0;}}
  .ledger-row:nth-child(2) .tick path{animation-delay:0.15s;}
  .ledger-row:nth-child(3) .tick path{animation-delay:0.3s;}
  .ledger-row:nth-child(4) .tick path{animation-delay:0.45s;}
  .ledger-row:nth-child(5) .tick path{animation-delay:0.6s;}
  .ledger-row:nth-child(6) .tick path{animation-delay:0.75s;}
  .ledger-foot{
    padding:14px 20px; font-family:var(--mono); font-size:0.7rem; color:var(--ink-soft);
    background:rgba(22,35,61,0.03); letter-spacing:0.04em;
  }

  /* ===== SECTION LABELS ===== */
  .section{padding:88px 0;}
  .section-head{max-width:560px; margin-bottom:56px;}
  .section-tag{
    font-family:var(--mono); font-size:0.72rem; letter-spacing:0.14em; text-transform:uppercase;
    color:var(--brass); margin-bottom:14px; display:block;
  }
  h2{
    font-family:var(--serif); font-size:2.15rem; font-weight:600; color:var(--ink); line-height:1.15;
  }
  .section-head p{color:var(--ink-soft); margin-top:14px; font-size:1rem; max-width:480px;}

  /* subject grid */
  .subject-strip{border-top:1.5px solid var(--ink);}
  .subject-line{
    display:grid; grid-template-columns:70px 1fr 1fr auto;
    align-items:center; padding:24px 0; border-bottom:1px solid var(--line);
    gap:20px;
  }
  .subject-line .num{font-family:var(--mono); color:var(--brass); font-weight:600; font-size:1.05rem;}
  .subject-line .name{font-family:var(--serif); font-size:1.35rem; font-weight:600;}
  .subject-line .desc{color:var(--ink-soft); font-size:0.92rem;}
  .subject-line .tag{
    font-family:var(--mono); font-size:0.68rem; letter-spacing:0.06em; text-transform:uppercase;
    border:1px solid var(--line); padding:6px 12px; border-radius:20px; color:var(--ink-soft);
    white-space:nowrap;
  }
  @media(max-width:720px){
    .subject-line{grid-template-columns:40px 1fr; row-gap:8px;}
    .subject-line .desc, .subject-line .tag{grid-column:2;}
  }

  /* why choose - features */
  .features{display:grid; grid-template-columns:repeat(3,1fr); gap:2px; background:var(--line); border:1px solid var(--line);}
  .feature-card{background:var(--paper-card); padding:36px 30px;}
  .feature-card .fnum{font-family:var(--mono); color:var(--rule-red); font-size:0.78rem; letter-spacing:0.08em; margin-bottom:16px; display:block;}
  .feature-card h3{font-family:var(--serif); font-size:1.2rem; font-weight:600; margin-bottom:10px;}
  .feature-card p{color:var(--ink-soft); font-size:0.9rem;}
  @media(max-width:820px){.features{grid-template-columns:1fr;}}

  .about{background:var(--ink); color:var(--paper);}
  .about .section-tag{color:var(--brass-light);}
  .about h2{color:var(--paper);}
  .about-grid{display:grid; grid-template-columns:220px 1fr; gap:48px; align-items:start;}
  .teacher-frame{
    width:220px; height:220px; border-radius:6px; border:1.5px solid var(--brass-light);
    overflow:hidden; flex-shrink:0;
  }
  .teacher-frame img{width:100%; height:100%; object-fit:cover; display:block;}
  .about p{color:rgba(246,241,231,0.82); max-width:560px; margin-bottom:16px;}
  .about-signature{font-family:var(--serif); font-style:italic; font-size:1.1rem; color:var(--brass-light); margin-top:20px; line-height:1.6;}
  @media(max-width:720px){.about-grid{grid-template-columns:1fr;} .teacher-frame{width:150px; height:150px;}}

  /* contact */
  .contact-grid{display:grid; grid-template-columns:1fr 1fr; gap:56px;}
  .info-row{display:flex; gap:16px; padding:18px 0; border-bottom:1px solid var(--line);}
  .info-row .lab{font-family:var(--mono); font-size:0.7rem; text-transform:uppercase; letter-spacing:0.1em; color:var(--brass); width:90px; flex-shrink:0; padding-top:2px;}
  .info-row .val{font-size:0.98rem; color:var(--ink);}
  form{background:var(--paper-card); border:1px solid var(--line); border-radius:6px; padding:32px; box-shadow:var(--shadow);}
  .field{margin-bottom:18px;}
  label{display:block; font-size:0.78rem; font-weight:600; margin-bottom:7px; color:var(--ink-soft);}
  input, select{
    width:100%; padding:12px 14px; border:1px solid var(--line); border-radius:4px;
    font-family:var(--sans); font-size:0.92rem; background:#fff; color:var(--ink);
  }
  input:focus, select:focus{outline:2px solid var(--brass); outline-offset:1px; border-color:var(--brass);}
  .submit-btn{
    width:100%; background:var(--ink); color:var(--paper); padding:14px; border:none;
    border-radius:4px; font-weight:600; font-size:0.94rem; cursor:pointer; transition:background .2s ease;
    margin-top:6px;
  }
  .submit-btn:hover{background:var(--ink-soft);}
  @media(max-width:820px){.contact-grid{grid-template-columns:1fr;}}

  footer{border-top:1px solid var(--line); padding:34px 0; text-align:center;}
  footer .foot-logo{width:44px; height:44px; margin:0 auto 12px;}
  footer .foot-logo img{width:100%; height:100%; object-fit:contain;}
  footer p{font-family:var(--mono); font-size:0.76rem; color:var(--ink-soft); letter-spacing:0.02em;}
  footer .foot-tagline{font-family:var(--mono); font-size:0.68rem; color:var(--brass); letter-spacing:0.1em; margin-top:6px;}

  @media(max-width:900px){
    .hero-grid{grid-template-columns:1fr;}
    h1{font-size:2.5rem;}
    .nav-links{display:none;}
  }

  @media (prefers-reduced-motion: reduce){
    *{animation-duration:0.001ms !important; animation-iteration-count:1 !important; transition-duration:0.001ms !important; scroll-behavior:auto !important;}
  }
</style>
</head>
<body>

<header>
  <nav class="wrap">
    <div class="brand">
      <div class="brand-mark"><img src="data:image/png;base64,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" alt="RAJE COMMERCE ACADEMY logo"></div>
      <div>
        RAJE COMMERCE ACADEMY
        <small>LEARN | PRACTICE | SUCCESS</small>
      </div>
    </div>
    <div class="nav-links">
      <a href="#subjects">Subjects</a>
      <a href="#courses">Courses</a>
      <a href="#about">About</a>
      <a href="#contact">Contact</a>
      <a href="#contact" class="nav-cta">Enrol Now</a>
    </div>
  </nav>
</header>

<section class="hero">
  <div class="wrap hero-grid">
    <div>
      <span class="eyebrow">Commerce Coaching · Class 11 to M.Com</span>
      <h1>Every concept, <em>balanced</em> and entered correctly.</h1>
      <p class="lede">Personal, exam-focused coaching in Accounts, Economics, OCM, Maths and English — taught the way a ledger is kept: clearly, in order, and checked twice.</p>
      <div class="hero-ctas">
        <a href="#contact" class="btn-primary">Book a Free Trial Class</a>
        <a href="#subjects" class="btn-secondary">View Subjects</a>
      </div>
    </div>

    <div class="ledger-card">
      <div class="ledger-head">
        <span>Sr.</span><span>Subject</span><span>Status</span>
      </div>
      <div class="ledger-row">
        <span class="no">01</span>
        <span class="subj">Accounts<span>Book-keeping &amp; Accountancy</span></span>
        <span class="tick"><svg viewBox="0 0 24 24"><path d="M4 12l5 5 11-11"/></svg></span>
      </div>
      <div class="ledger-row">
        <span class="no">02</span>
        <span class="subj">Maths<span>Mathematics &amp; Statistics</span></span>
        <span class="tick"><svg viewBox="0 0 24 24"><path d="M4 12l5 5 11-11"/></svg></span>
      </div>
      <div class="ledger-row">
        <span class="no">03</span>
        <span class="subj">Eco<span>Economics</span></span>
        <span class="tick"><svg viewBox="0 0 24 24"><path d="M4 12l5 5 11-11"/></svg></span>
      </div>
      <div class="ledger-row">
        <span class="no">04</span>
        <span class="subj">OCM<span>Organisation of Commerce &amp; Mgmt.</span></span>
        <span class="tick"><svg viewBox="0 0 24 24"><path d="M4 12l5 5 11-11"/></svg></span>
      </div>
      <div class="ledger-row">
        <span class="no">05</span>
        <span class="subj">English<span>Language &amp; Comprehension</span></span>
        <span class="tick"><svg viewBox="0 0 24 24"><path d="M4 12l5 5 11-11"/></svg></span>
      </div>
      <div class="ledger-foot">All entries reconciled — batches open for new admissions</div>
    </div>
  </div>
</section>

<section class="section" id="subjects">
  <div class="wrap">
    <div class="section-head">
      <span class="section-tag">Subjects Taught</span>
      <h2>The full commerce register.</h2>
      <p>Five subjects, one teacher, one continuous thread — so nothing you learn in one class feels disconnected from the next.</p>
    </div>
    <div class="subject-strip">
      <div class="subject-line">
        <span class="num">01</span>
        <span class="name">Accounts</span>
        <span class="desc">Journal entries to final accounts, built step by step.</span>
        <span class="tag">Std. 11 &amp; 12</span>
      </div>
      <div class="subject-line">
        <span class="num">02</span>
        <span class="name">Maths</span>
        <span class="desc">Commerce mathematics &amp; statistics, minus the panic.</span>
        <span class="tag">Std. 11 &amp; 12</span>
      </div>
      <div class="subject-line">
        <span class="num">03</span>
        <span class="name">Eco</span>
        <span class="desc">Micro and macroeconomics explained with real examples.</span>
        <span class="tag">Std. 11 &amp; 12</span>
      </div>
      <div class="subject-line">
        <span class="num">04</span>
        <span class="name">OCM</span>
        <span class="desc">Organisation of Commerce &amp; Management, made practical.</span>
        <span class="tag">Std. 11 &amp; 12</span>
      </div>
      <div class="subject-line">
        <span class="num">05</span>
        <span class="name">English</span>
        <span class="desc">Grammar, comprehension and writing for board exams.</span>
        <span class="tag">Std. 11 &amp; 12</span>
      </div>
    </div>
  </div>
</section>

<section class="section" style="padding-top:0;" id="degree">
  <div class="wrap">
    <div class="section-head">
      <span class="section-tag">After 12th</span>
      <h2>Coaching continues into your degree.</h2>
      <p>For students moving on to B.Com and M.Com, with focused coaching in Accounts, Maths, and Auditing &amp; Taxation.</p>
    </div>
    <div class="subject-strip">
      <div class="subject-line">
        <span class="num">01</span>
        <span class="name">B.Com</span>
        <span class="desc">Accounts, Maths, and Auditing &amp; Taxation for undergraduate commerce.</span>
        <span class="tag">Degree</span>
      </div>
      <div class="subject-line">
        <span class="num">02</span>
        <span class="name">M.Com</span>
        <span class="desc">Accounts, Maths, and Auditing &amp; Taxation at the postgraduate level.</span>
        <span class="tag">Post-Graduate</span>
      </div>
    </div>
  </div>
</section>

<section class="section" id="courses">
  <div class="wrap">
    <div class="section-head">
      <span class="section-tag">Technical Courses</span>
      <h2>Practical skills, alongside the syllabus.</h2>
      <p>Short, hands-on computer courses that pair well with your commerce studies.</p>
    </div>
    <div class="subject-strip">
      <div class="subject-line">
        <span class="num">01</span>
        <span class="name">MS-CIT</span>
        <span class="desc">Foundational computer literacy course.</span>
        <span class="tag">Beginner</span>
      </div>
      <div class="subject-line">
        <span class="num">02</span>
        <span class="name">MS-Office</span>
        <span class="desc">Word, Excel and PowerPoint for everyday and office use.</span>
        <span class="tag">Beginner</span>
      </div>
      <div class="subject-line">
        <span class="num">03</span>
        <span class="name">Tally Prime + GST with TDS</span>
        <span class="desc">Practical accounting, GST filing and TDS on Tally Prime.</span>
        <span class="tag">Job-oriented</span>
      </div>
    </div>
  </div>
</section>

<section class="section" style="padding-top:0;">
  <div class="wrap">
    <div class="section-head">
      <span class="section-tag">Why Raje Commerce Academy</span>
      <h2>Taught like it's your only subject.</h2>
    </div>
    <div class="features">
      <div class="feature-card">
        <span class="fnum">— A</span>
        <h3>Small batches</h3>
        <p>Limited seats per batch so every student gets individual attention, not just a seat in a crowd. (10 Seats per Batch)</p>
      </div>
      <div class="feature-card">
        <span class="fnum">— B</span>
        <h3>Board-exam focused</h3>
        <p>Every class ties back to the actual exam pattern — no wasted time on what won't be tested.</p>
      </div>
      <div class="feature-card">
        <span class="fnum">— C</span>
        <h3>Doubt-clearing built in</h3>
        <p>Regular sessions to go back over what didn't stick, until it does.</p>
      </div>
    </div>
  </div>
</section>

<section class="section about" id="about">
  <div class="wrap about-grid">
    <div class="teacher-frame"><img src="data:image/jpeg;base64,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" alt="Founder of RAJE COMMERCE ACADEMY"></div>
    <div>
      <span class="section-tag">About the Teacher</span>
      <h2>Commerce, taught with care.</h2>
      <p>Raje Commerce Academy is built around one idea: commerce subjects are easiest to learn when they're taught in order, explained patiently, and revisited until they're second nature.</p>
      <p>Every student's progress is tracked class by class — much like a well-kept ledger — so no topic is left unchecked before the next one begins.</p>
      <p class="about-signature">— Prof. Raje Padmanabh<br><span style="font-style:normal; font-family:var(--sans); font-size:0.82rem; opacity:0.85;">B.Com | M.Com | DTL | GST P. | MBA (Pursuing)<br>Professionally Certified Tax Consultant · with 2 Years Teaching Experience</span></p>
    </div>
  </div>
</section>

<section class="section" id="contact">
  <div class="wrap">
    <div class="section-head">
      <span class="section-tag">Get In Touch</span>
      <h2>Reserve a seat in the next batch.</h2>
      <p>Fill in the form and we'll get back to you with batch timings.</p>
    </div>
    <div class="contact-grid">
      <div>
        <div class="info-row"><span class="lab">Phone</span><span class="val">9527589232 / 7387747579</span></div>
        <div class="info-row"><span class="lab">Email</span><span class="val">raje.comac2k26@gmail.com</span></div>
        <div class="info-row"><span class="lab">Address</span><span class="val">Bldg No.: 81/03, Nilambari Society, M. Phulenagar, Behind the Pratik Vadapaav, Chinchwad, Pune - 411019.</span></div>
        <div class="info-row"><span class="lab">Timings</span><span class="val">Std. 11: 5 PM – 7 PM &nbsp;|&nbsp; Std. 12: 7 PM – 9 PM</span></div>
      </div>
      <form>
        <div class="field">
          <label for="name">Student Name</label>
          <input id="name" type="text" placeholder="Full name">
        </div>
        <div class="field">
          <label for="class">Class</label>
          <select id="class">
            <option>Std. 11</option>
            <option>Std. 12</option>
            <option>B.Com</option>
            <option>M.Com</option>
            <option>Technical Course</option>
          </select>
        </div>
        <div class="field">
          <label for="subject">Subject Interested In</label>
          <select id="subject">
            <option>Accounts</option>
            <option>Maths</option>
            <option>Eco</option>
            <option>OCM</option>
            <option>English</option>
            <option>All Subjects</option>
            <option>B.Com</option>
            <option>M.Com</option>
            <option>MS-CIT</option>
            <option>MS-Office</option>
            <option>Tally Prime + GST with TDS</option>
          </select>
        </div>
        <div class="field">
          <label for="phone">Phone Number</label>
          <input id="phone" type="tel" placeholder="10-digit mobile number">
        </div>
        <button type="button" class="submit-btn">Request a Callback</button>
      </form>
    </div>
  </div>
</section>

<footer>
  <div class="foot-logo"><img src="data:image/png;base64,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" alt="RAJE COMMERCE ACADEMY logo"></div>
  <p>RAJE COMMERCE ACADEMY</p>
  <p class="foot-tagline">LEARN | PRACTICE | SUCCESS</p>
</footer>

</body>
</html>
