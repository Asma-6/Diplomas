import React, { useEffect, useState } from 'react';
import { useHistory } from "react-router-dom";
import PropTypes from 'prop-types';
import { createTheme, ThemeProvider, withStyles } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';
import Typography from '@material-ui/core/Typography';
import NavBar from '../Navigation/NavBar';
import UsersGrid from '../Users/UsersGrid';
import Header from '../Navigation/Header';
import AssignmentIndIcon from '@material-ui/icons/AssignmentInd';
import FolderIcon from '@material-ui/icons/Folder';
import EditIcon from '@material-ui/icons/Edit';
import VisibilityIcon from '@material-ui/icons/Visibility';
import PersonIcon from '@material-ui/icons/Person';
import Profil from '../Users/Profil';
import FormsPage from '../formulaires/FormsPage';
import AllDiplomes from '../Diplomes/AllDiplomes'
import TimeLine from '../Diplomes/TimeLine'
import LinkIcon from '@material-ui/icons/Link';
import InsertDriveFileIcon from '@material-ui/icons/InsertDriveFile';
import SchoolIcon from '@material-ui/icons/School';
import TimelineIcon from '@material-ui/icons/Timeline';
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

function Copyright() {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {'Copyright © Suivi de Diplômes '}
      {new Date().getFullYear()}
      {'.'}
    </Typography>
  );
}

let theme = createTheme({
  palette: {
    primary: {
      light: '#63ccff',
      main: '#009be5',
      dark: '#006db3',
    },
  },
  typography: {
    h5: {
      fontWeight: 500,
      fontSize: 26,
      letterSpacing: 0.5,
    },
  },
  shape: {
    borderRadius: 8,
  },
  props: {
    MuiTab: {
      disableRipple: true,
    },
  },
  mixins: {
    toolbar: {
      minHeight: 48,
    },
  },
});

theme = {
  ...theme,
  overrides: {
    MuiDrawer: {
      paper: {
        backgroundColor: '#18202c',
      },
    },
    MuiButton: {
      label: {
        textTransform: 'none',
      },
      contained: {
        boxShadow: 'none',
        '&:active': {
          boxShadow: 'none',
        },
      },
    },
    MuiTabs: {
      root: {
        marginLeft: theme.spacing(1),
      },
      indicator: {
        height: 3,
        borderTopLeftRadius: 3,
        borderTopRightRadius: 3,
        backgroundColor: theme.palette.common.white,
      },
    },
    MuiTab: {
      root: {
        textTransform: 'none',
        margin: '0 16px',
        minWidth: 0,
        padding: 0,
        [theme.breakpoints.up('md')]: {
          padding: 0,
          minWidth: 0,
        },
      },
    },
    MuiIconButton: {
      root: {
        padding: theme.spacing(1),
      },
    },
    MuiTooltip: {
      tooltip: {
        borderRadius: 4,
      },
    },
    MuiDivider: {
      root: {
        backgroundColor: '#404854',
      },
    },
    MuiListItemText: {
      primary: {
        fontWeight: theme.typography.fontWeightMedium,
      },
    },
    MuiListItemIcon: {
      root: {
        color: 'inherit',
        marginRight: 0,
        '& svg': {
          fontSize: 20,
        },
      },
    },
    MuiAvatar: {
      root: {
        width: 32,
        height: 32,
      },
    },
  },
};

const drawerWidth = 256;

const styles = {
  root: {
    display: 'flex',
    minHeight: '100vh',
  },
  drawer: {
    [theme.breakpoints.up('sm')]: {
      width: drawerWidth,
      flexShrink: 0,
    },
  },
  app: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
  },
  main: {
    flex: 1,
    padding: theme.spacing(6, 4),
    background: '#eaeff1',
  },
  footer: {
    padding: theme.spacing(2),
    background: '#eaeff1',
  },
};

function AdminAcceuil(props) {

  const { classes, openUser , openForms , openProfil , openDiplomes, title } = props;
  const [mobileOpen, setMobileOpen] = useState(false);
  const [currentIndex, setCurrentIndex] = useState(1);
  const [navItems, setNavItems] = useState([]);
  const history = useHistory();

  //console.log(props);
  useEffect(() => {
    if (props?.role !== 1) {
      history.push("/Acceuil");
      window.location.reload();  // reload here obligatory
    }
    else {
      setNavItems(
        [
          {
            id: 'Menu',
            children: [
              { id: 'Utilisateurs', icon: <PersonIcon />, active: true, link: '/Users' },
              { id: 'Formulaires', icon: <LinkIcon />, link: '/Forms' },
              { id: 'Demandes en attente', icon: <InsertDriveFileIcon />, link: '/DemandesEnAttente' },
              { id: 'Diplômes', icon: <SchoolIcon />, link: '/Diplomes' },
            ],
          },
          {
            id: 'Profil',
            children: [
              { id: 'Afficher', icon: <VisibilityIcon />, link: '/Profil' },
            ],
          },
          {
            id: 'Tableau de bord',
            children: [
              { id: 'Statistiques', icon: <TimelineIcon />, active: true, link: '/Statistiques' },
            ],
          },
        ]
      );
    }
  }, []);

  const handleDrawerToggle = () => {
    setMobileOpen(!mobileOpen);
  };

  const handleCallback = (childData) => {
    setCurrentIndex(childData);
  };


  return (
    <ThemeProvider theme={theme}>
      <div className={classes.root}>
        <CssBaseline />
        <nav className={classes.drawer}>
          <NavBar PaperProps={{ style: { width: drawerWidth } }}
            navItems={navItems} />
        </nav>
        <div className={classes.app}>
          <Header onDrawerToggle={handleDrawerToggle} parentCallback={handleCallback} title={title} />
          <main className={classes.main}>
            {openUser && <UsersGrid />}
            {openForms && <FormsPage />}
            {openDiplomes && <AllDiplomes />}
            {openProfil && <Profil />}


          </main>
          <footer className={classes.footer}>
            <Copyright />
          </footer>
        </div>
      </div>
    </ThemeProvider>
  );
}

AdminAcceuil.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(AdminAcceuil);
